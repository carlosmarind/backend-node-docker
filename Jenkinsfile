pipeline {
    agent { label 'wsl'}
    stages {
        stage('Build de aplicacion Node'){
            steps {
                sh 'node -v'
                sh 'npm install'
            }   
        }
    }
}
