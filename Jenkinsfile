pipeline {
    agent any

    stages {
        stage('clone') {
            steps {
                echo 'Clonando repositorio...'
            }
        }

        stage('test') {
            steps {
                sh '''
                pip3 install flask pytest --break-system-packages
                python3 -m pytest
                '''
            }
        }

        stage('build image') {
            steps {
                sh '''
                docker build -t josemiguellealroman/app-ci-cd:latest .
                '''
            }
        }

        stage('dockerhub') {
            steps {
                sh '''
                docker login -u josemiguellealroman -p Madafaca1617
                docker push josemiguellealroman/app-ci-cd:latest
                '''
            }
        }

        stage('deploy') {
            steps {
                sh '''
                kubectl apply -f deployment.yaml
                kubectl apply -f service.yaml
                '''
            }
        }
    }
}
