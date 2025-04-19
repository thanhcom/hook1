pipeline {
    agent any

    tools {
        maven 'Maven_3'
        jdk 'JDK_11'
    }

    environment {
        IMAGE_NAME = 'thanhcom/my-app'
        IMAGE_TAG = 'latest'
        DOCKERHUB_CREDENTIALS = credentials('docker-hub')  // thêm trong Jenkins Credentials
    }


    stages {
        stage('Clone') {
            steps {
                git url: 'https://github.com/thanhcom/hook1.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }

       }

    post {
        success {
            echo '✅ CI/CD thành công!'
        }
        failure {
            echo '❌ Có lỗi xảy ra!'
        }
    }
}
