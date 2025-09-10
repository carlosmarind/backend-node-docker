pipeline {
    agent { 
        docker { 
            image 'node:24-alpine'
            label 'wsl'
            }
    }
    stages {
        stage('Build de aplicacion Node'){
            steps {
                sh 'node -v'
                sh 'npm install'
            }   
        }
    }
}
