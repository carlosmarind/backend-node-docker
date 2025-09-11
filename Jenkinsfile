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
     command: ["/bin/sh", "-c","tail -f /dev/null"]
  -  name: kubectl
     image: alpine/k8s:1.32.2
     command: ["/bin/sh", "-c","tail -f /dev/null"]
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
        stage('kubectl para cluster'){
            steps {
                container('kubectl'){
                    sh 'kubectl get pod'
                }
            }   
        }
    }
}