#!/bin/bash

HUGO_COMMAND=$1
DEPLOY_TIER=$2
S3_SYNC=$3

echo "Currently in buildDeploy.sh"
echo 'The value of HUGO_COMMAND:' ${HUGO_COMMAND}
echo 'The value of DEPLOY_TIER:' ${DEPLOY_TIER}
echo 'The value of S3_SYNC:' ${S3_SYNC}

if [[ $DEPLOY_TIER == 'production' ]]
    then
    base_url=labs.waterdata.usgs.gov
    echo "Will attempt deploy to production using the base URL" ${base_url}

elif [[ $DEPLOY_TIER == 'staging' ]]
    then
    base_url=labs-staging.waterdata.usgs.gov
    echo "Will attempt deploy to staging using the base URL" ${base_url}

elif [[ $DEPLOY_TIER == 'development' ]]
    then
    base_url=labs-development.waterdata.usgs.gov
    echo "Will attempt deploy to development using the base URL" ${base_url}

else
    base_url=labs-development.waterdata.usgs.gov
    echo "No valid deployment tier was submitted to application. Deployment tier of 'development' will be assumed. The base URL is" ${base_url}
fi

/bin/bash hugoCommand.sh $HUGO_COMMAND
if [[ $S3_SYNC == 'sync_yes' ]]
    then /bin/bash awsTierDeploy.sh $base_url
fi
