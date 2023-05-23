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
      docker build -t example-java-web .
    }  
    stage('Publish'){
    // docker login
    // docker tag    
    // docker push
    }

  }
}

//Task 4 - Run Unit Test
//Task 5 - Archive the test report