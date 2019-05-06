#!/bin/bash

HUGO_COMMAND=$1
DEPLOY_TIER=$2
S3_SYNC=$3

echo "in buildDeploy.sh"
echo 'this is the value of HUGO_COMMAND:' ${HUGO_COMMAND}
echo 'this is the value of DEPLOY_TIER:' ${DEPLOY_TIER}
echo 'this is the value of S3_SYNC:' ${S3_SYNC}

if [[ $DEPLOY_TIER == 'production' ]]
    then
    base_url=labs.waterdata.usgs.gov
    echo "Deploy to production ran.The base URL is" ${base_url}

elif [[ $DEPLOY_TIER == 'staging' ]]
    then
    base_url=labs-staging.waterdata.usgs.gov
    echo "Deploy to staging ran.The base URL is" ${base_url}

elif [[ $DEPLOY_TIER == 'development' ]]
    then
    base_url=labs-development.waterdata.usgs.gov
    echo "Deploy to development ran.The base URL is" ${base_url}

else
    base_url=labs-development.waterdata.usgs.gov
    echo "No valid deployment tier was submitted to application. Deployment tier of 'development' will be assumed. The base URL is" ${base_url}
fi

/bin/bash entrypoint.sh $HUGO_COMMAND
if [[ $S3_SYNC == 'sync_yes' ]]
    then /bin/bash awsTierDeploy.sh ${base_url}
fi
