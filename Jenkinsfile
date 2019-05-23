pipeline {
  agent {
    node {
      label 'project:any'
    }
  }
  parameters {
    choice(choices: ['test', 'qa', 'prod'], description: 'desired deployment environment', name: 'DEPLOY_TIER')
  }
  stages {
    stage('Build') {
      agent {
        dockerfile {
          additionalBuildArgs "--build-arg HUGO_COMMAND=build --build-arg DEPLOY_TIER=$DEPLOY_TIER --build-arg AWS_SYNC=sync_yes"
          args '-u root:root -v "${WORKSPACE}":/src'
          reuseNode true
        }
      }
      steps {
        echo 'Docker image build complete, preparing to run image/container/hugo'
        sh "/src/buildDeploy.sh build ${DEPLOY_TIER} sync_yes"
      }
    }
  }
}
