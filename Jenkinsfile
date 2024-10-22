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
                    // Собираем Docker образ
                    sh 'docker build -t myapp:latest .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Останавливаем и удаляем предыдущую версию контейнера, если он запущен
                    sh 'docker stop myapp || true'
                    sh 'docker rm myapp || true'

                    // Запускаем новый контейнер с приложением
                    sh 'docker run -d --name myapp -p 8080:8080 myapp:latest'
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
