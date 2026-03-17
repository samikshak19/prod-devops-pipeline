pipeline {
  agent any

  environment {
    PATH = "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
  }

  stages {
    stage('Test Shell') {
      steps {
        sh 'echo "Hello from Jenkins"'
        sh 'which docker || true'
        sh 'docker --version || true'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t devops-app .'
      }
    }

    stage('Run Container') {
      steps {
        sh 'docker run -d -p 5002:5001 devops-app'
      }
    }
  }
}
