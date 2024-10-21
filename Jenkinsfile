pipeline {
    agent any

    tools {
        maven 'Maven 3.9.9' // Укажи точное имя Maven, которое ты добавил в "Global Tool Configuration"
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
    }

    post {
        always {
            junit '**/target/surefire-reports/*.xml'
            cleanWs()
        }
    }
}
