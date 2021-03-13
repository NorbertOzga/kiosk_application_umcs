pipeline {
  agent { docker { image 'python:latest' } }
  stages {
    stage('build') {
      steps {
        dir("backend") {
          withEnv(["HOME=${env.WORKSPACE}"]) {
            sh 'pip install -r requirements.txt'
          }
        }
      }
    }
    stage('test') {
      steps {
        dir("backend") {
           withEnv(["HOME=${env.WORKSPACE}"]) {
            sh 'python  run.py'
           }
        }
      }   
    }
  }
}