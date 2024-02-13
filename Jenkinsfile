pipeline {
    agent any

    environment {
        // Docker image adı ve tag'ı
        DOCKER_IMAGE = 'kullaniciadiniz/flask-app'
        DOCKER_TAG = 'latest'
        // Spinnaker Webhook URL
        SPINNAKER_WEBHOOK_URL = 'http://spinnaker-api.yourdomain.com/webhooks/webhook/spinnakerWebhook'
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Docker image'ını build et
                    sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                    // Docker Hub'a push et (opsiyonel)
                    sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
                }
            }
        }

        stage('Test') {
            steps {
                // Test komutlarınızı buraya ekleyin
                // Örnek: sh 'echo "Test adımı burada gerçekleştirilecek"'
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Spinnaker webhook URL'sine HTTP POST isteği gönder
                    sh "curl -X POST ${SPINNAKER_WEBHOOK_URL} -H 'Content-type: application/json' -d '{\"parameter1\":\"value1\", \"parameter2\":\"value2\"}'"
                }
            }
        }
    }
}
