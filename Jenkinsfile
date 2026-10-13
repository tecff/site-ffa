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

    // ── Parameter design ────────────────────────────────────────────────
    // Only JOBS is declared here because it's the only truly uniform knob.
    // The other build parameters (GLUON_TARGETS, GLUON_AUTOUPDATER_BRANCH,
    // SIGN_BUILD, BROKEN, GLUON_DEPRECATED) VARY PER JOB and are therefore
    // defined in each job's config.xml (ParameterDefinitions). Declaring
    // them here would make Jenkins' declarative-pipeline reconciliation
    // RESET every job's per-job default back to the Jenkinsfile default on
    // each run — silently producing wrong builds (e.g. a per-target job
    // building ALL targets). The pipeline body still consumes them via
    // params.*, null-safe, so jobs that don't define a given param simply
    // get its implicit falsy/empty behaviour.
    parameters {
        string(name: 'JOBS', defaultValue: '', description: 'Parallel make jobs (e.g. 9). Empty = auto-detect from /proc/cpuinfo.')
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

                    // Extract GLUON_GIT_REF and GLUON_GIT_URL from Makefile
                    env.GLUON_GIT_REF = sh(
                        returnStdout: true,
                        script: "sed -n 's/^GLUON_GIT_REF.*:= *//p' Makefile"
                    ).trim()
                    env.GLUON_GIT_URL = sh(
                        returnStdout: true,
                        script: "sed -n 's/^GLUON_GIT_URL.*:= *//p' Makefile"
                    ).trim()
                    if (!env.GLUON_GIT_REF) {
                        error("Failed to extract GLUON_GIT_REF from Makefile")
                    }
                    if (!env.GLUON_GIT_URL) {
                        error("Failed to extract GLUON_GIT_URL from Makefile")
                    }
                    if (!(env.GLUON_GIT_REF ==~ /^[0-9a-zA-Z._-]+$/)) {
                        error("Invalid GLUON_GIT_REF (expected commit hash or tag): ${env.GLUON_GIT_REF}")
                    }
                    echo "Detected GLUON_GIT_REF: ${env.GLUON_GIT_REF}"
                }

                sh '''#!/usr/bin/env bash
                    set -euo pipefail
                    mkdir -p "$GLUON_CACHE_DIR"
                    if [ ! -d "$GLUON_CACHE_DIR/.git" ]; then
                        echo "# cache empty -> cloning gluon into cache"
                        git clone "$GLUON_GIT_URL" "$GLUON_CACHE_DIR"
                    else
                        echo "# gluon-build cache already initialized"
                    fi

                    echo "# updating cache to GLUON_GIT_REF=$GLUON_GIT_REF"
                    cd "$GLUON_CACHE_DIR"
                    git fetch --tags origin
                    git checkout -q -f "$GLUON_GIT_REF"
                '''
            }
        }

        stage('Build build-env image') {
            steps {
                script {
                    // --- Rootless Docker support ---------------------------------------------------
                    // Fall back to the rootless socket if the default daemon is unreachable
                    // (Jenkins sh steps do not inherit the systemd user session environment).
                    if (sh(script: 'docker info >/dev/null 2>&1', returnStatus: true) != 0) {
                        def uid = sh(returnStdout: true, script: 'id -u').trim()
                        env.XDG_RUNTIME_DIR = "/run/user/${uid}"
                        env.DOCKER_HOST = "unix://${env.XDG_RUNTIME_DIR}/docker.sock"
                    }
                    sh 'docker info >/dev/null 2>&1 || { echo "ERROR: no usable Docker daemon (default and rootless socket tried)"; exit 1; }'

                    // In rootless mode the user namespace maps container uid 0 to the host user
                    // (jenkins), which owns the bind-mounted cache. The gluon Dockerfile declares
                    // `USER gluon` (uid 100), which in rootless mode maps to an unmapped subordinate
                    // host uid and would have no write access to the cache. Override it with
                    // --user 0:0 so the container runs as the mapped-to-jenkins user.
                    // For rootful daemons keep the historical behaviour (--user <host uid>:<gid>).
                    def isRootless = sh(script: 'docker info 2>/dev/null | grep -q rootless', returnStatus: true) == 0
                    echo "Docker rootless mode: ${isRootless}"
                    if (isRootless) {
                        env.DOCKER_USER_ARG = '--user 0:0'
                    } else {
                        def uid = sh(returnStdout: true, script: 'id -u').trim()
                        def gid = sh(returnStdout: true, script: 'id -g').trim()
                        env.DOCKER_USER_ARG = "--user ${uid}:${gid}"
                    }

                    def hostArch = sh(returnStdout: true, script: 'uname -m').trim()
                    def targetArch = (hostArch == 'x86_64') ? 'amd64' :
                                     (hostArch == 'aarch64') ? 'arm64' :
                                     null
                    if (targetArch == null) {
                        error("Unsupported build node arch: ${hostArch}. Map it to Docker TARGETARCH first.")
                    }
                    // Reusable, content-keyed image tag: one image per pinned gluon ref,
                    // shared by consecutive builds AND sibling jobs on the same branch
                    // (their Makefiles pin the same GLUON_GIT_REF). Deliberately no arch
                    // component: this build host is single-arch (anything else fails
                    // above); TARGETARCH still reaches the build via --build-arg.
                    // GLUON_GIT_REF is validated upstream to [0-9a-zA-Z._-]; the '/'
                    // substitution is defensive in case that validation ever loosens.
                    def safeRef = env.GLUON_GIT_REF.replaceAll('/', '-')
                    env.BUILD_IMAGE = "site-ffa-gluon-buildenv:${safeRef}"
                    env.TARGETARCH = targetArch
                    // Deterministic container name: lets post-always (and the host
                    // sweeper) force-remove OUR container after an abort, where the
                    // docker client was killed before it could stop the container.
                    env.CONTAINER_NAME = "gluon-build-${env.BUILD_TAG}".toLowerCase()
                }

                sh '''#!/usr/bin/env bash
                    set -euo pipefail
                    # --pull keeps the base image fresh: when the upstream digest moves,
                    # the cache busts automatically and the apt layer rebuilds with
                    # current packages. No --no-cache: with the ref-keyed tag, repeats
                    # of the same ref are a near no-op thanks to the layer cache.
                    docker build --pull \
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
                    def makeFlags = "${jobsFlag} --output-sync=recurse".trim()
                    def makeVars = "V=s BUILD_LOG=1"
                    if (params.GLUON_TARGETS?.trim()) {
                        makeVars += " GLUON_TARGETS='${params.GLUON_TARGETS.trim()}'"
                    }
                    if (params.GLUON_AUTOUPDATER_BRANCH?.trim()) {
                        makeVars += " GLUON_AUTOUPDATER_BRANCH='${params.GLUON_AUTOUPDATER_BRANCH.trim()}'"
                    }
                    if (params.BROKEN) {
                        makeVars += ' BROKEN=1'
                    }
                    if (params.GLUON_DEPRECATED?.trim()) {
                        makeVars += " GLUON_DEPRECATED='${params.GLUON_DEPRECATED.trim()}'"
                    }
                    def makeTarget = params.SIGN_BUILD ? 'sign' : 'all'
                    def cacheMount = '-v "$GLUON_CACHE_DIR":/gluon/gluon-build --tmpfs /tmp'
                    // Rootless bind mounts expose the raw host uid, making git refuse to operate
                    // on the checked-out repo ("dubious ownership"). Trust it via env-var config.
                    def gitSafeDir = '-e GIT_CONFIG_COUNT=1 -e GIT_CONFIG_KEY_0=safe.directory -e GIT_CONFIG_VALUE_0=/gluon/gluon-build'

                    if (params.SIGN_BUILD) {
                        withCredentials([file(credentialsId: 'gluon-secret-key', variable: 'SECRET_KEY_PATH')]) {
                            sh """#!/usr/bin/env bash
                                set -euo pipefail
                                docker run --rm \
                                    --name "\$CONTAINER_NAME" \
                                    --init \
                                    --stop-timeout 30 \
                                    ${env.DOCKER_USER_ARG} \
                                    -e HOME=/gluon \
                                    ${gitSafeDir} \
                                    -v "\$WORKSPACE":/gluon \
                                    ${cacheMount} \
                                    -v "\$SECRET_KEY_PATH":/run/secrets/gluon-secret-key:ro \
                                    -w /gluon \
                                    "\$BUILD_IMAGE" \
                                    bash -lc "set -euo pipefail; make ${makeFlags} ${makeVars} SECRET_KEY_FILE=/run/secrets/gluon-secret-key ${makeTarget}"
                            """
                        }
                    } else {
                        sh """#!/usr/bin/env bash
                            set -euo pipefail
                            docker run --rm \
                                --name "\$CONTAINER_NAME" \
                                --init \
                                --stop-timeout 30 \
                                ${env.DOCKER_USER_ARG} \
                                -e HOME=/gluon \
                                ${gitSafeDir} \
                                -v "\$WORKSPACE":/gluon \
                                ${cacheMount} \
                                -w /gluon \
                                "\$BUILD_IMAGE" \
                                bash -lc "set -euo pipefail; make ${makeFlags} ${makeVars} ${makeTarget}"
                        """
                    }
                }
            }
        }
    }

    post {
        always {
            // Aborted builds: Jenkins SIGTERMs (then SIGKILLs) the sh step's process
            // tree. A SIGKILLed docker client cannot stop its container, so the
            // build container would keep compiling forever. Declarative post-always
            // still runs on ABORTED, giving us a reliable place to force-remove it
            // by its deterministic name (no-op after a clean exit thanks to --rm).
            sh '''
                if [ -n "${CONTAINER_NAME:-}" ]; then
                    docker rm -f "$CONTAINER_NAME" 2>/dev/null || true
                fi
            '''
            archiveArtifacts artifacts: 'output/**', allowEmptyArchive: true, fingerprint: true
            // The ref-keyed build-env image is intentionally KEPT so later builds and
            // sibling jobs reuse it. Superseded ref tags accumulate (~1 GB each);
            // prune old site-ffa-gluon-buildenv:* tags periodically on the host.
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
