pipeline {
    agent any

    // Fix PATH issues on macOS / Jenkins
    environment {
        PATH = "/usr/bin:/bin:/usr/sbin:/sbin"
        PATH+EXTRA = "/opt/homebrew/bin"
    }

    stages {

        stage('Checkout Repository') {
            steps {
                // Explicit named arguments required
                git(
                    url: 'https://github.com/samikshak19/prod-devops-pipeline.git',
                    branch: 'main',
                    credentialsId: 'Jenkins-git'
                )
            }
        }

        stage('Debug PATH & Tools') {
            steps {
                sh '''
                    echo "PATH = $PATH"
                    which git
                    git --version
                    which docker
                    docker --version || echo "Docker CLI not found"
                    which terraform
                    terraform -version || echo "Terraform not found"
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t devops-app .'
            }
        }

        stage('Run Docker Container') {
            steps {
                // Remove any previous container with same name
                sh '''
                    docker rm -f devops-app-container || true
                    docker run -d --name devops-app-container -p 5001:5001 devops-app
                '''
            }
        }

        stage('Terraform Init & Plan') {
            steps {
                dir('terraform') {
                    sh '''
                        terraform init
                        terraform plan -out=tfplan
                    '''
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    input message: "Approve Terraform Apply?"
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }

    }

    post {
        always {
            echo "Cleaning up workspace..."
            sh 'docker rm -f devops-app-container || true'
        }
        success {
            echo "Pipeline completed successfully!"
        }
        failure {
            echo "Pipeline failed."
        }
    }
}
