pipeline {
    agent any

    
   environment {
    PATH = "/usr/bin:/bin:/usr/sbin:/sbin:/opt/homebrew/bin:/usr/local/bin"
}


    stages {

        stage('Checkout Repository') {
            steps {
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
                    stage('Build Docker Image') {
    steps {
        sh 'docker --version'
        sh 'docker build -t myimage:latest .'
    }
}
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
