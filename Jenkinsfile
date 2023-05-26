pipeline {
  agent any
  environment {
    DOCKER_PASS = credentials('docker_pass')
    SONAR_TOKEN = credentials('sonar_token')
  }
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
    stage('CodeInspection'){
      steps {
        sh '/var/jenkins_home/.sonar/sonar-scanner-4.7.0.2747-linux/bin/sonar-scanner   -Dsonar.organization=at20-devops   -Dsonar.projectKey=at20cv   -Dsonar.sources=.   -Dsonar.host.url=https://sonarcloud.io -Dsonar.java.binaries=build'
      }
    }
    stage('Quality Gate'){
      // Get the computed result from sonar cloud 
      // if passed -> continue with the pipeline
      // if failed -> fail the pipeline
    }

    stage('Package'){
      steps {
        sh 'docker build -t example-java-web .'
      }
    }  
    stage('Publish'){
      steps {
        sh 'docker login -u crgv -p ${DOCKER_PASS}'
        sh 'docker tag example-java-web crgv/java-web'
        sh 'docker push crgv/java-web'
      }
    }

  }
  post {
    //notification
    // message to Slack w pipeline status
    // email to team w pipeline status
    always {
      sh 'echo clean dangling images'
    }
  }
}

//Task 4 - Run Unit Test
//Task 5 - Archive the test report
//Task 6 - Package and Publish the docker image
//Task 7 - Code Inspection and Quality Gate stages
