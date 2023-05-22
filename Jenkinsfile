pipeline {
  agent any
  stages {
    stage('Test') {
      agent { docker 'node:18-alpine3.16-cb' }
      steps {
        sh 'npm install'
        sh 'npm test'
      }
    }
  }
}

//Task 4 - Run Unit Test