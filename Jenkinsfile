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
                pytest
                '''
            }
        }

        stage('build image') {
            steps {
                sh '''
                docker build -t TU_USUARIO/app-ci-cd:latest .
                '''
            }
        }

        stage('dockerhub') {
            steps {
                sh '''
                docker login -u TU_USUARIO -p TU_PASSWORD
                docker push TU_USUARIO/app-ci-cd:latest
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
