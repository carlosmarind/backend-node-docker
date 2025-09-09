pipeline {
    agent { label 'docker'}
    stages {
        stage('Dependencias y Test'){
            steps {
                sh 'echo "saludos desde mi primer pipeline"'
                sh 'echo "nuevo saludo desde mi primer pipeline"'
                sh 'docker ps'
            }   
        }
    }
}
