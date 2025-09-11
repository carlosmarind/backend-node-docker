pipeline {
    agent {
        kubernetes  {
            yaml """
apiVersion: v1
kind: Pod
spec:
  serviceAccountName: jenkins-sa
  containers:
  -  name: node
     image: node:24-alpine
            """
        }
    }
    stages {
        stage('Build docker application aplicacion Node'){
            steps {
                container('node'){
                    sh 'node --version'
                }
            }   
        }
    }
}