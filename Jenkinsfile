pipeline {
  agent { docker { image 'python:latest' } }
  stages {
    stage('build') {
      steps {
        dir("backend") {
          sh 'pip install -r requirements.txt'
        }
      }
    }
    stage('test') {
      steps {
        dir("backend") {
          sh 'python run.py'
        }
      }   
    }
  }
}