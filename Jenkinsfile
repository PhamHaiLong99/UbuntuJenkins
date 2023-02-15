pipeline {
    agent any
    stages {
        stage('Build image') {
            steps {
                echo 'Starting to build docker image'

                script {
                    docker.build("ubuntu-test:${env.BUILD_ID}")
                    // customImage.push()
                    docker.withRegistry('reg.longph.works', 'reg') {
                    docker.image('ubuntu-test').push()
                    }
                }

           
            }
        }
    }
}