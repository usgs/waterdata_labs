#!/bin/bash

DEPLOY_TIER=$1

if [[ $DEPLOY_TIER == 'production' ]]
    then
    base_url=labs.waterdata.usgs.gov
elif [[ $DEPLOY_TIER == 'staging' ]]
    then
    base_url=labs-staging.waterdata.usgs.gov
else
    base_url=labs-development.waterdata.usgs.gov
fi

/bin/bash entrypoint.sh $base_url
/bin/bash awsTierDeploy.sh $base_url