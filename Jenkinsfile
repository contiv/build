#!groovy
pipeline {
  agent { label 'public' }
  options {
    timeout(time: 30, unit: 'MINUTES')
  }
  stages {
    stage('Build CentOS') {
      steps {
        sh '''
          set -euo pipefail
          make -C packer build-centos
        '''
      }
    }
  }
}
