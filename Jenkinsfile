pipeline {
    agent any

    environment {
        // Docker ve Registry yapılandırması
        APP_NAME = 'flask-app'
        DOCKER_REGISTRY = 'y3ko'
        DOCKER_IMAGE = "${DOCKER_REGISTRY}/${APP_NAME}"
        DOCKER_TAG = 'latest'
        // Spinnaker Webhook URL
        SPINNAKER_WEBHOOK_URL = 'http://spinnaker-api.yourdomain.com/webhooks/webhook/spinnakerWebhook'
    }

    stages {
        stage('Prepare Environment') {
            steps {
                script {
                    // Docker ve Kubernetes CLI'ları için giriş yapma adımları burada yer alabilir
                    // Örneğin: Docker Hub'a login
                    sh "echo unutmam12 | docker login --username y3ko --password-stdin"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Docker image'ını Docker registry'ye push et
                    sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
                }
            }
        }

        stage('Deploy to Spinnaker') {
            steps {
                script {
                    // Spinnaker webhook URL'sine HTTP POST isteği gönder
                    sh "curl -X POST ${SPINNAKER_WEBHOOK_URL} -H 'Content-type: application/json' -d '{\"docker_image\": \"${DOCKER_IMAGE}:${DOCKER_TAG}\"}'"
                }
            }
        }
    }
}
