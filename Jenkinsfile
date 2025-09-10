pipeline {
    agent { label 'wsl' }
    stages {
        stage('Build docker application aplicacion Node'){
            steps {
                script{
                    docker.withRegistry("https://ghcr.io", "reg-cred-id"){
                        sh 'docker build -t backend-node-docker:latest .'
                        sh 'docker tag backend-node-docker:latest ghcr.io/carlosmarind/backend-node-docker'
                        sh "docker tag backend-node-docker:latest ghcr.io/carlosmarind/backend-node-docker:${env.BUILD_NUMBER}"
                        sh 'docker push ghcr.io/carlosmarind/backend-node-docker'
                        sh "docker push ghcr.io/carlosmarind/backend-node-docker:${env.BUILD_NUMBER}"
                        sh "echo 'branch: ${env.BRANCH_NAME}'"
                        sh "echo 'build: ${env.BUILD_NUMBER}'"
                    }
                }
            }   
        }
        stage('deploy app'){
            steps {
                script{
                    //docker.withRegistry("https://ghcr.io", "reg-cred-id"){
                        sh "kubectl set image deployment/backend-node backend-node=ghcr.io/carlosmarind/backend-node-docker:${env.BUILD_NUMBER}"
                }
            }   
        }
    }
}