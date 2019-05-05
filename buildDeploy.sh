#!/bin/bash

HUGO_COMMAND=$1
DEPLOY_TIER=$2
S3_SYNC=$3

echo "in buildDeploy"
echo ${HUGO_COMMAND}
echo ${DEPLOY_TIER}

if [[ $DEPLOY_TIER == 'production' ]]
    then
    echo 'deploy to production ran'
    base_url=labs.waterdata.usgs.gov
elif [[ $DEPLOY_TIER == 'staging' ]]
    then
    echo 'deploy to staging ran'
    base_url=labs-staging.waterdata.usgs.gov
else
    echo 'deploy to development ran'
    base_url=labs-development.waterdata.usgs.gov
fi

/bin/bash entrypoint.sh $HUGO_COMMAND

if [[ $S3_SYNC == 'sync_yes' ]]
    then /bin/bash awsTierDeploy.sh $base_url
fi
