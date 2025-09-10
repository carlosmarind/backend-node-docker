pipeline {
    agent { label 'wsl' }
    stages {
        stage('Build docker application aplicacion Node'){
            steps {
                sh 'docker build -t backend-node-docker:latest .'
            }   
        }
    }
}