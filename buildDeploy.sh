#!/bin/bash


HUGO_COMMAND=$1
DEPLOY_TIER=$2
S3_SYNC=$3
DEPLOY_TIER="${DEPLOY_TIER:-default value}"

S3_SYNC=$"{S3_SYNC:-sync_no}"

echo "Currently in buildDeploy.sh"
echo 'The value of HUGO_COMMAND:' ${HUGO_COMMAND}
echo 'The value of DEPLOY_TIER:' ${DEPLOY_TIER}
echo 'The value of S3_SYNC:' ${S3_SYNC}

if [[ $DEPLOY_TIER == 'production' ]]
    then
    base_url=labs.waterdata.usgs.gov

elif [[ $DEPLOY_TIER == 'staging' ]]
    then
    base_url=labs-staging.waterdata.usgs.gov

elif [[ $DEPLOY_TIER == 'development' ]]
    then
    base_url=labs-development.waterdata.usgs.gov

else
    base_url=labs-development.waterdata.usgs.gov
    echo "No valid deployment tier was submitted to application. Deployment tier of 'development' will be assumed."
fi
echo "Using the base URL:" ${base_url}

# run the script for the running Hugo
/bin/bash hugoCommand.sh $HUGO_COMMAND

if [[ $S3_SYNC == 'sync_yes' ]]
    then /bin/bash awsTierDeploy.sh $base_url
fi
