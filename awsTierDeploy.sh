#!/usr/bin/env bash

DEPLOY_TIER=$1

if [[ $DEPLOY_TIER == 'production' ]]
    then
    echo "deploy to production" > textProduction.txt
#    aws s3 sync /public/public s3://labs.waterdata.usgs.gov --delete
elif [[ $DEPLOY_TIER == 'staging' ]]
    then
    echo "deploy to staging" > textStaging.txt
#    aws s3 sync /public/public s3://labs-staging.waterdata.usgs.gov --delete
else
    echo "deploy to development" > textDev.txt
#    aws s3 sync /public/public s3://labs-development.waterdata.usgs.gov --delete
fi