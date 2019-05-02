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
          additionalBuildArgs "--build-arg HUGO_VERSION=0.55.4 --build-arg DEPLOY_TIER=$DEPLOY_TIER"
          args '-u root:root -v "${WORKSPACE}":/src -e "HUGO_BASEURL=/labs.waterdata.usgs.gov"'
          reuseNode true
        }
      }
    }
  }
}
