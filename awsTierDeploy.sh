#!/usr/bin/env bash

if [[ $DEPLOY_TIER == 'production' ]]
    then
    aws s3 sync /public/public s3://labs.waterdata.usgs.gov --delete
elif [[ $DEPLOY_TIER == 'staging' ]]
    then
    aws s3 sync /public/public s3://labs-staging.waterdata.usgs.gov --delete
else
    aws s3 sync /public/public s3://labs-development.waterdata.usgs.gov --delete
fi