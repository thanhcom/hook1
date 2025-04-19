pipeline {
    agent any

    tools {
        maven 'Maven_3'     // Tên đã cấu hình trong Jenkins > Global Tool Configuration
        jdk 'JDK_11'        // JDK version phù hợp
    }

    environment {
        MAVEN_OPTS = "-Dmaven.test.failure.ignore=false"
    }

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
