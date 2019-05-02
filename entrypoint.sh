#!/bin/bash

set -eux -o pipefail

COMMAND=$1
ARGS=${@:2}

echo $COMMAND

#if [[ $DEPLOY_TIER == 'production' ]]
#    then
#    echo "deploy to production" > textProduction.txt
##    aws s3 sync /public/public s3://labs.waterdata.usgs.gov --delete
#elif [[ $DEPLOY_TIER == 'staging' ]]
#    then
#    echo "deploy to staging" > textStaging.txt
##    aws s3 sync /public/public s3://labs-staging.waterdata.usgs.gov --delete
#else
#    echo "deploy to development" > textDev.txt
#    aws s3 sync /public/public s3://labs-development.waterdata.usgs.gov --delete
#    echo "ran the aws deploy"
#fi

#echo $ARGS > /text.txt
#echo $COMMAND >> /text.txt
#
#case ${COMMAND} in
#    build)
#        cd /src/themes/wdfn_theme
#        npm install
#        npm run build
#        cd /src
#        hugo ${ARGS}
#        ;;
#    server)
#        cd /src/themes/wdfn_theme
#        npm install
#        npm run watch & cd /src && hugo server --bind=0.0.0.0 ${ARGS}
#        ;;
#    *)
#        exec "$@"
#        ;;
#esac
