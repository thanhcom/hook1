pipeline {
    agent any

    tools {
        maven 'Maven_3'
        jdk 'JDK_17'
    }
environment {
        IMAGE_NAME = 'my-app'
        DOCKER_REGISTRY =
         DOCKERHUB_CREDENTIALS = credentials('docker-hub')  // thêm trong Jenkins Credentials
    }

    stages {

        stages {
            stage('Checkout') {
                steps {
                    git url: 'https://github.com/thanhcom/hook1.git', branch: 'main'
            }
        }

        stage('Build') {
                steps {
                    sh 'mvn clean install'
            }
        }

        stage('Unit Test') {
                steps {
                    sh 'mvn test'
            }
        }

        stage('Archive Artifact') {
                steps {
                    archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }
    }

    post {
            success {
                echo '✅ Build & test passed!'
        }
        failure {
                echo '❌ Build failed!'
        }
    }
    }
}
