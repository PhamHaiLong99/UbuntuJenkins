pipeline {
    agent any
    environment {
        DOCKER_REGISTRY = 'https://reg.longph.works'
        DOCKER_REGISTRY_CREDENTIALS = 'reg'
        IMAGE_NAME = 'ubuntu-test'
        IMAGE_TAG = '${env.BUILD_ID}'
        // KUBECONFIG = '<kubeconfig-id>'
        // NAMESPACE = '<namespace>'
    }
    stages {
        stage('Build image') {
            steps {
                echo 'Starting to build docker image'
                echo "$IMAGE_NAME"
                echo "$IMAGE_TAG"
                script {
                    docker.withRegistry(DOCKER_REGISTRY, DOCKER_REGISTRY_CREDENTIALS) {
                    def dockerImage = docker.build("${IMAGE_NAME}:${IMAGE_TAG}", './')
                    dockerImage.push()
                    dockerImage.push('latest')
                    } 
                }
            }
        }
        stage('Pull image and Deploy') {
            steps {
                echo 'Starting to pull docker image'
                script {
                    docker.withRegistry(DOCKER_REGISTRY, DOCKER_REGISTRY_CREDENTIALS) {
                        def dockerImage = docker.image("${IMAGE_NAME}:${IMAGE_TAG}")
                        image.pull()
                        image.run()
                    }
                }
            }
        }
        // stage('Run image') {
        //     steps {
        //         echo 'Starting to run docker image'
        //         script {

        //             } 
        //         }
        //     }
        // }
    }
}