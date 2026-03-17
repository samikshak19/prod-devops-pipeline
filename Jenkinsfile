pipeline {
  agent any
  stages {
    stage('Clone Repository') {
      steps {
        git 'https://github.com/samikshak19/production-devops-pipeline'
      }
    }
    stage('Build Docker Image') {
      steps {
        sh 'docker build -t devops-app .'
      }
    }
    stage('Run Container') {
      steps {
        sh 'docker run -d -p 5000:5000 devops-app'
      }
    }
  }
}
