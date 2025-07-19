pipeline {
    agent any

    environment {
        ROBOT_REPORTS = "robot_reports"
    }

    tools {
        python 'Python3'
    }

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'github-ssh-jenkins', url: 'git@github.com:emil-pelak/allegro-tests.git'
            }
        }

        stage('Setup Python + Dependencies') {
            steps {
                sh 'python3 -m venv venv'
                sh './venv/bin/pip install --upgrade pip'
                sh './venv/bin/pip install -r requirements.txt'
            }
        }

        stage('Run Robot Tests') {
            steps {
                sh './venv/bin/robot -d ${ROBOT_REPORTS} tests/'
            }
        }

        stage('Publish Results') {
            steps {
                archiveArtifacts artifacts: "${ROBOT_REPORTS}/**", allowEmptyArchive: false
                publishHTML([
                    reportName: 'Robot Report',
                    reportDir: "${ROBOT_REPORTS}",
                    reportFiles: 'report.html',
                    keepAll: true,
                    alwaysLinkToLastBuild: true
                ])
            }
        }
    }

    post {
        failure {
            echo "❌ Testy nie przeszły!"
        }
        success {
            echo "✅ Wszystko działa!"
        }
    }
}