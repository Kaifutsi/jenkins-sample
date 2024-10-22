pipeline {
    agent any

    tools {
        maven 'Maven 3.9.9'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Kaifutsi/jenkins-sample.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t myapp:latest .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Останавливаем и удаляем предыдущий контейнер, если он существует
                    sh 'docker stop myapp || true'
                    sh 'docker rm myapp || true'

                    // Запускаем новый контейнер
                    sh 'docker run -d --name myapp -p 8081:8080 myapp:latest'
                }
            }
        }
    }

    post {
        always {
            junit '**/target/surefire-reports/*.xml'
            cleanWs()
        }
    }
}
