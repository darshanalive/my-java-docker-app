pipeline {
  agent any

  environment {
    DOCKER_BFLASK_IMAGE = "yourdockerhubusername/myjava1:latest"
    DOCKER_REGISTRY_CREDS = "docker-hub-creds"
  }

  stages {
    stage('Build') {
      steps {
        sh 'docker build -t myjava1 .'
        sh 'docker tag myjava1 $DOCKER_BFLASK_IMAGE'
      }
    }

    stage('Test') {
      steps {
        sh 'docker run myjava1'
      }
    }

    stage('Deploy') {
      steps {
        withCredentials([usernamePassword(
          credentialsId: "${DOCKER_REGISTRY_CREDS}",
          usernameVariable: 'DOCKER_USERNAME',
          passwordVariable: 'DOCKER_PASSWORD'
        )]) {
          sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin docker.io'
          sh 'docker push $DOCKER_BFLASK_IMAGE'
        }
      }
    }
  }

  post {
    always {
      sh 'docker logout'
    }
  }
}
