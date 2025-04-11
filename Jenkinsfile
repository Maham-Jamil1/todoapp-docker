pipeline {
    agent any

    environment {
        IMAGE_NAME = "todoapp-react"
        CONTAINER_NAME = "todoapp-container"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/Maham-Jamil1/todoapp-docker.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Stop and remove container if it exists
                    sh "docker rm -f ${CONTAINER_NAME} || true"
                    // Run new container on port 80
                    sh "docker run -d --name ${CONTAINER_NAME} -p 80:80 ${IMAGE_NAME}"
                }
            }
        }
    }
}
