pipeline {
  agent any
  stages {
    stage('Test') {
      agent {
        docker {
          image: "node:18-alpine3.16"
        }
      }
      steps {
        sh 'npm version'
      }
    }
  }
}