pipeline {
    agent any
    stages {
        stage('Build image') {
            steps {
                echo 'Starting to build docker image'

                script {
                    docker.withRegistry('https://reg.longph.works', 'reg') {
                    def dockerImage = docker.build("ubuntu-test:${env.BUILD_ID}", './')
                    dockerImage.push()
                    dockerImage.push('latest')
                    } 
                }

           
            }
        }
    }
}