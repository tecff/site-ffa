pipeline {
    agent any

    options {
        timestamps()
        timeout(time: 14, unit: 'HOURS')
        disableConcurrentBuilds()
    }

    environment {
        GLUON_CACHE_BASE = '/var/lib/jenkins/gluon-build-cache'
    }

    parameters {
        string(name: 'GLUON_TARGETS', defaultValue: '', description: 'Optional: override GLUON_TARGETS (space-separated). Empty = use Makefile defaults.')
        string(name: 'GLUON_AUTOUPDATER_BRANCH', defaultValue: 'experimental', description: 'Autoupdater branch (e.g. experimental, stable). Required when SIGN_BUILD=true.')
        string(name: 'JOBS', defaultValue: '', description: 'Parallel make jobs (e.g. 9). Empty = auto-detect from /proc/cpuinfo.')
        booleanParam(name: 'SIGN_BUILD', defaultValue: false, description: 'Sign the autoupdater manifest. Requires gluon-secret-key credential in Jenkins.')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Prepare gluon-build cache') {
            steps {
                script {
                    def safeBranch = (env.BRANCH_NAME ?: env.GIT_BRANCH?.replaceFirst('origin/', '') ?: 'unknown')
                                         .replaceAll('[^a-zA-Z0-9._-]', '-')
                    env.GLUON_CACHE_DIR = "${env.GLUON_CACHE_BASE}/${safeBranch}"

                    // Extract GLUON_GIT_REF from Makefile
                    env.GLUON_GIT_REF = sh(
                        returnStdout: true,
                        script: "sed -n 's/^GLUON_GIT_REF.*:= *//p' Makefile"
                    ).trim()
                    if (!env.GLUON_GIT_REF) {
                        error("Failed to extract GLUON_GIT_REF from Makefile")
                    }
                    if (!(env.GLUON_GIT_REF ==~ /[0-9a-f]{7,40}/)) {
                        error("Invalid GLUON_GIT_REF (expected commit hash): ${env.GLUON_GIT_REF}")
                    }
                    echo "Detected GLUON_GIT_REF: ${env.GLUON_GIT_REF}"
                }

                sh '''#!/usr/bin/env bash
                    set -euo pipefail
                    mkdir -p "$GLUON_CACHE_DIR"
                    if [ ! -d "$GLUON_CACHE_DIR/.git" ]; then
                        echo "# cache empty -> cloning gluon into cache"
                        git clone https://github.com/freifunk-gluon/gluon.git "$GLUON_CACHE_DIR"
                    else
                        echo "# gluon-build cache already initialized"
                    fi

                    echo "# updating cache to GLUON_GIT_REF=$GLUON_GIT_REF"
                    cd "$GLUON_CACHE_DIR"
                    git fetch origin
                    git checkout -q -f "$GLUON_GIT_REF"
                '''
            }
        }

        stage('Build build-env image') {
            steps {
                script {
                    def hostArch = sh(returnStdout: true, script: 'uname -m').trim()
                    def targetArch = (hostArch == 'x86_64') ? 'amd64' :
                                     (hostArch == 'aarch64') ? 'arm64' :
                                     null
                    if (targetArch == null) {
                        error("Unsupported build node arch: ${hostArch}. Map it to Docker TARGETARCH first.")
                    }
                    def safeTag = env.BUILD_TAG.replaceAll('[^a-zA-Z0-9._-]', '-')
                    env.BUILD_IMAGE = "site-ffa-gluon-buildenv:${safeTag}"
                    env.TARGETARCH = targetArch
                }

                sh '''#!/usr/bin/env bash
                    set -euo pipefail
                    docker build --pull --no-cache \
                        --build-arg TARGETOS=linux \
                        --build-arg TARGETARCH="$TARGETARCH" \
                        -t "$BUILD_IMAGE" \
                        -f "$GLUON_CACHE_DIR/contrib/docker/Dockerfile" \
                        "$GLUON_CACHE_DIR"
                '''
            }
        }

        stage('Build firmware') {
            steps {
                script {
                    if (params.SIGN_BUILD && !params.GLUON_AUTOUPDATER_BRANCH?.trim()) {
                        error('SIGN_BUILD=true requires GLUON_AUTOUPDATER_BRANCH to be set.')
                    }

                    def jobsFlag = params.JOBS?.trim() ? "-j${params.JOBS.trim()}" : ''
                    def makeVars = "V=s BUILD_LOG=1"
                    if (params.GLUON_TARGETS?.trim()) {
                        makeVars += " GLUON_TARGETS='${params.GLUON_TARGETS.trim()}'"
                    }
                    if (params.GLUON_AUTOUPDATER_BRANCH?.trim()) {
                        makeVars += " GLUON_AUTOUPDATER_BRANCH='${params.GLUON_AUTOUPDATER_BRANCH.trim()}'"
                    }
                    def makeTarget = params.SIGN_BUILD ? 'sign' : 'all'
                    def cacheMount = '-v "$GLUON_CACHE_DIR":/gluon/gluon-build --tmpfs /tmp'

                    if (params.SIGN_BUILD) {
                        withCredentials([file(credentialsId: 'gluon-secret-key', variable: 'SECRET_KEY_PATH')]) {
                            sh """#!/usr/bin/env bash
                                set -euo pipefail
                                docker run --rm \
                                    --user \$(id -u):\$(id -g) \
                                    -e HOME=/gluon \
                                    -v "\$WORKSPACE":/gluon \
                                    ${cacheMount} \
                                    -v "\$SECRET_KEY_PATH":/run/secrets/gluon-secret-key:ro \
                                    -w /gluon \
                                    "\$BUILD_IMAGE" \
                                    bash -lc "set -euo pipefail; make ${jobsFlag} ${makeVars} SECRET_KEY_FILE=/run/secrets/gluon-secret-key ${makeTarget}"
                            """
                        }
                    } else {
                        sh """#!/usr/bin/env bash
                            set -euo pipefail
                            docker run --rm \
                                --user \$(id -u):\$(id -g) \
                                -e HOME=/gluon \
                                -v "\$WORKSPACE":/gluon \
                                ${cacheMount} \
                                -w /gluon \
                                "\$BUILD_IMAGE" \
                                bash -lc "set -euo pipefail; make ${jobsFlag} ${makeVars} ${makeTarget}"
                        """
                    }
                }
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'output/**', allowEmptyArchive: true, fingerprint: true
            sh 'docker rmi -f "$BUILD_IMAGE" >/dev/null 2>&1 || true'
            emailext(
                to: '$DEFAULT_RECIPIENTS',
                recipientProviders: [requestor()],
                subject: '$DEFAULT_SUBJECT',
                body: '$DEFAULT_CONTENT',
                attachLog: true,
                compressLog: true
            )
        }
        cleanup {
            cleanWs()
        }
    }
}
