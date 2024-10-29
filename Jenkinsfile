pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
        DOCKER_IMAGE = 'saitejac614/jenkins-app:latest'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/saitejac614/JavaApp-HelloWorld.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Run unit tests
                    // Assuming you have a testing framework like JUnit or similar
                    sh 'javac -cp .:junit-4.13.1.jar HelloWorldTest.java'
                    sh 'java -cp .:junit-4.13.1.jar org.junit.runner.JUnitCore HelloWorldTest'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
                    sh "docker push ${DOCKER_IMAGE}"
                }
            }
        }

        stage('Deploy to QA') {
            steps {
                script {
                    // Deploy to QA environment
                    // This could be done using Docker, Kubernetes, or another method, depending on your QA setup
                    // Example with Docker:
                    sh "docker run -d --name qa-instance -p 8081:8080 ${DOCKER_IMAGE}"
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
            sh 'docker rm -f qa-instance || true'
        }
        success {
            echo 'Build, test, and QA deployment completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Please check the logs for details.'
        }
    }
}
