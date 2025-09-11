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
  -  name: kaniko
     image: gcr.io/kaniko-project/executor:debug
     command: ["/bin/sh", "-c","tail -f /dev/null"]
     volumeMounts:
     - name: kaniko-secret
       mountPath: /kaniko/.docker/config.json
       subPath: .dockerconfigjson
  volumes:
  - name: kaniko-secret
    secret:
      secretName: ghcr-registry
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
        stage('Build image'){
            steps {
                container('kaniko'){
                   sh """
                        /kaniko/executor \
                        --context=. \
                        --dockerfile=Dockerfile \
                        --destination=ghcr.io/carlosmarind/backend-node-docker:${env.BUILD_NUMBER}
                        --image-fs-extract-retry 5
                        --push-retry

                   """
                }
            }   
        }
    }
}