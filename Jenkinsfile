pipeline {
  agent any
  options {
    // Stop the build early in case of compile or test failures
    skipStagesAfterUnstable()
  }
  stages {
    stage('Building') {
        try {
             sh './build.sh'
        } finally {
            echo '[FAILURE] Failed to build'
        }
    }
    }

}