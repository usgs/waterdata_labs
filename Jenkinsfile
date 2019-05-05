pipeline {
  agent {
    node {
      label 'project:any'
    }
  }
  parameters {
    choice(choices: ['development', 'staging', 'production'], description: 'deployment environment', name: 'DEPLOY_TIER')
  }
  stages {
    stage('Build') {
      agent {
        dockerfile {
          additionalBuildArgs "--build --build-arg DEPLOY_TIER=$DEPLOY_TIER --build-arg sync_yes "
          args '-u root:root -v "${WORKSPACE}":/src '
          reuseNode true
        }
      }
      steps {
        echo 'build complete'
      }
    }
  }
}