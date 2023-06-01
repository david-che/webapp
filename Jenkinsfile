pipeline {  
  agent any
  stages {
    stage('Checkout Code ') {
      steps {
        echo 'Checkout Code '
        git(url: 'https://github.com/david-che/webapp.git', changelog: true, branch: 'master', poll: true)
      }
    }

    stage('build Docker Image') {
      steps {
        echo 'build Docker Image'
        sh 'docker build -t david755chen/webapp:$BUILD_ID .'
      }
    }

    stage('Run & Test the Container') {
      steps {
        echo 'Run & Test the Container'
        sh 'docker run -d -p 5001:5001 --name webapp-demo david755chen/webapp:$BUILD_ID'
        sh 'sleep 5'
        sh 'curl localhost:5001'
        sh 'docker stop webapp-demo && docker rm webapp-demo'
      }
    }

    stage('Upload to DockerHub') {
      steps {
        echo 'Upload to DockerHub'
        withCredentials(bindings:[usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'pass', usernameVariable: 'user')]) {
          sh "docker login -u $user -p $pass"
          sh 'docker push david755chen/webapp:$BUILD_ID'
        }
      }
    }

  }
}
