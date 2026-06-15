pipeline {
    agent any

    options {
        timestamps()
        timeout(time: 8, unit: 'HOURS')
        disableConcurrentBuilds()
    }

    parameters {
        string(name: 'GLUON_TARGETS', defaultValue: '', description: 'Optional: override GLUON_TARGETS (space-separated). Empty = use Makefile defaults.')
        booleanParam(name: 'SIGN_BUILD', defaultValue: false, description: 'Sign the autoupdater manifest. Requires tagged release and gluon-secret-key credential in Jenkins.')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
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
                    // sanitize BUILD_TAG: slashes from folder-based job names break Docker tag syntax
                    def safeTag = env.BUILD_TAG.replaceAll('[^a-zA-Z0-9._-]', '-')
                    env.BUILD_IMAGE = "site-ffa-gluon-buildenv:${safeTag}"
                    env.TARGETARCH = targetArch
                }

                sh '''
                    set -euo pipefail
                    docker build --pull \
                        --build-arg TARGETOS=linux \
                        --build-arg TARGETARCH="$TARGETARCH" \
                        -t "$BUILD_IMAGE" \
                        -f contrib/docker/Dockerfile .
                '''
            }
        }

        stage('Build firmware') {
            steps {
                script {
                    def targetOverride = params.GLUON_TARGETS?.trim() ? "GLUON_TARGETS='${params.GLUON_TARGETS.trim()}'" : ''

                    if (params.SIGN_BUILD) {
                        withCredentials([file(credentialsId: 'gluon-secret-key', variable: 'SECRET_KEY_PATH')]) {
                            sh """
                                set -euo pipefail
                                docker run --rm \
                                    --user \$(id -u):\$(id -g) \
                                    -e HOME=/gluon \
                                    -v "\$PWD":/gluon \
                                    -v "\$SECRET_KEY_PATH":/run/secrets/gluon-secret-key:ro \
                                    -w /gluon \
                                    "\$BUILD_IMAGE" \
                                    bash -lc "set -euo pipefail; make ${targetOverride} SECRET_KEY_FILE=/run/secrets/gluon-secret-key sign"
                            """
                        }
                    } else {
                        sh """
                            set -euo pipefail
                            docker run --rm \
                                --user \$(id -u):\$(id -g) \
                                -e HOME=/gluon \
                                -v "\$PWD":/gluon \
                                -w /gluon \
                                "\$BUILD_IMAGE" \
                                bash -lc "set -euo pipefail; make ${targetOverride} all"
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
        }
        cleanup {
            cleanWs()
        }
    }
}
