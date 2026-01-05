pipeline {
    agent any

    environment {
        SONARQUBE_ENV = 'sonarqube-local'
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Srushtideshmukh44/jenkins-ci-demo.git',
                    credentialsId: 'github-creds'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                script {
                    def scannerHome = tool 'sonar-scanner'
                    withSonarQubeEnv('sonarqube-local') {
                        bat """
                        "${scannerHome}\\bin\\sonar-scanner.bat" ^
                        -Dsonar.projectKey=jenkins-ci ^
                        -Dsonar.sources=. ^
                        -Dsonar.host.url=http://localhost:9000 ^
                        -Dsonar.login=%SONAR_AUTH_TOKEN%
                        """
                    }
                }
            }
        }

        stage('Quality Gate') {
            steps {
                timeout(time: 2, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }

        stage('Docker Build') {
            steps {
                bat 'docker build -t jenkins-ci-demo:latest .'
            }
        }
    }
    
        post {

        success {
            mail to: 'deshmukh.srushti04@gmail.com',
                 subject: "SUCCESS: Jenkins CI Pipeline - ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                 body: """
Hello,

Good news 🎉

The Jenkins pipeline has completed SUCCESSFULLY.

Job Name   : ${env.JOB_NAME}
Build No   : ${env.BUILD_NUMBER}
Status     : SUCCESS
Build URL  : ${env.BUILD_URL}

Regards,
Jenkins
"""
        }

        failure {
            mail to: 'deshmukh.srushti04@gmail.com',
                 subject: "FAILURE: Jenkins CI Pipeline - ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                 body: """
Hello,

Attention ❌

The Jenkins pipeline has FAILED.

Job Name   : ${env.JOB_NAME}
Build No   : ${env.BUILD_NUMBER}
Status     : FAILURE
Build URL  : ${env.BUILD_URL}

Please check the console output.

Regards,
Jenkins
"""
        }
    }

}
