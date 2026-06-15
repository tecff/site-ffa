pipeline {
    agent {
        dockerfile {
            filename 'contrib/docker/Dockerfile'
            additionalBuildArgs '--no-cache'
            args '-v /tmp/gluon-cache:/build/gluon-build'
        }
    }

    options {
        timestamps()
        timeout(time: 8, unit: 'HOURS')
        disableConcurrentBuilds()
    }

    environment {
        GLUON_TARGETS = 'ath79-generic x86-64'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'make GLUON_TARGETS="${GLUON_TARGETS}"'
            }
        }

        stage('Archive') {
            steps {
                archiveArtifacts artifacts: 'output/**', fingerprint: true
            }
        }
    }

    post {
        failure {
            echo 'Build failed.'
        }
        success {
            echo 'Build successful.'
        }
        always {
            cleanWs()
        }
    }
}
