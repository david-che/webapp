pipeline {
  agent any
  stages {
    stage('Checkout Code ') {
      steps {
        echo 'Checkout Code '
        git(url: 'https://github.com/david-che/webapp.git', changelog: true, branch: 'main', poll: true)
      }
    }

    stage('build Docker Image') {
      steps {
        echo 'build Docker Image'
      }
    }

    stage('Run & Test the Container') {
      steps {
        echo 'Run & Test the Container'
      }
    }

    stage('Upload to DockerHub') {
      steps {
        echo 'Upload to DockerHub'
      }
    }

  }
}