pipeline {
    agent any

    environment {
        GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp-service-account') // Referencing the GCP service account key
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/yourusername/yourrepo.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                    cd /terraform
                    terraform init
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                    cd /terraform
                    terraform plan -out=tfplan
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: 'Proceed with Terraform Apply?'
                sh '''
                    cd /terraform
                    terraform apply -auto-approve tfplan
                '''
            }
        }
    }

    post {
        always {
            cleanWs() // Clean workspace after completion
        }
        success {
            echo 'Terraform applied successfully on GCP!'
        }
        failure {
            echo 'Terraform apply failed.'
        }
    }
}
