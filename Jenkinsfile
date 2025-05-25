pipeline {
  agent any
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  stages {
    stage('Clone Repo') {
      steps {
        git branch: 'dev', url: 'https://github.com/sreejesht/react-app-deployment.git'
      }
    }
    stage('Build Image') {
      steps {
        sh './build.sh'
      }
    }
    stage('Push to DockerHub Dev') {
      steps {
        script {
          docker.withRegistry('', 'dockerhub') {
            def app = docker.build("sreedocker911/react-app:dev")
            app.push()
          }
        }
      }
    }
    stage('Deploy to EC2') {
      steps {
        sshagent(['ec2-ssh-key']) {
          sh "ssh -o StrictHostKeyChecking=no ec2-user@<EC2-IP> 'bash -s' < deploy.sh"
        }
      }
    }
  }
}