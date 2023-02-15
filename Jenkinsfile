pipeline {
    agent any
    environment {
        DOCKER_REGISTRY = 'https://reg.longph.works'
        DOCKER_PREFIX = "reg.longph.works"
        DOCKER_REGISTRY_CREDENTIALS = 'reg'
        IMAGE_NAME = 'ubuntu-test'
        IMAGE_TAG = sh(returnStdout: true, script: 'echo $BUILD_ID').trim()
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
                    // dockerImage.push()
                        dockerImage.push('latest')
                        // dockerImage.run()
                    }
                }
            }
        }
        stage('Pull image and Deploy') {
            steps {
                echo 'Starting to pull docker image'
                echo "$DOCKER_PREFIX/$IMAGE_NAME"
                script {
                    docker.withRegistry(DOCKER_REGISTRY, DOCKER_REGISTRY_CREDENTIALS) {
                        def image = docker.image("$IMAGE_NAME:latest")
                        image.pull()
                        image.run()
                    }
                }
            }
        }
        // stage('Pull image') {
        //     steps {
        //         sh "docker pull $DOCKER_PREFIX/$IMAGE_NAME:latest"
        //         echo 'Pull image success'
        //     }
        // }
        // stage('Run image') {
        //     steps {
        //         sh "docker run -d $DOCKER_PREFIX/$IMAGE_NAME:latest"
        //         echo 'Run image success'
        //     }
        // }
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