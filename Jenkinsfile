pipeline {
  agent any
  stages {
    stage('Test') {
      steps {
        sh './gradlew clean build'
      }
      post {
        always {
          archiveArtifacts artifacts: 'build/reports/tests/test/index.html', followSymlinks: false
        }
      }
    }
    stage('Package'){
      steps {
        sh 'docker build -t example-java-web .'
      }
    }  
    stage('Publish'){
      steps {
    // docker login
        sh ' echo docker tag example-java-web crgv/java-web'
        sh 'echo docker push crgv/java-web'
      }
    }

  }
}

//Task 4 - Run Unit Test
//Task 5 - Archive the test report