pipeline {
  agent any
  stages {
    stage('Building') {
      steps {
        try {
         sh './build.sh'
        } finally {
            echo '[FAILURE] Failed to build'
         }
      }

    }
  }
}