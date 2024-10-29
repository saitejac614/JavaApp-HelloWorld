pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials') // Docker Hub credentials ID in Jenkins
        DOCKER_IMAGE = 'saitejac614/jenkins-app:latest'              // Docker Hub image name
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository
                git 'https://github.com/saitejac614/JavaApp-HelloWorld.git' // Replace with your GitHub repo URL
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }
        
        stage('Push to Docker Hub') {
            steps {
                script {
                    // Log into Docker Hub
                    sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
                    
                    // Push the Docker image
                    sh "docker push ${DOCKER_IMAGE}"
                }
            }
        }
    }
}
