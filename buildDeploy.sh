#!/bin/bash

# This script can receive a number of arguments from the command line, docker-compose file, or the Jenkinsfile
# The first argument will always be a Hugo related command, usually 'build' or 'server'
# The second argument can be a deployment tier from the Jenkinsfile or a Hugo
# related command, such as '--buildDrafts from the docker-compose file or the command line.'
# The third argument (if present) will usually indicate whether the build Hugo site should be
# delivered to an AWS S3 bucket for storage.
HUGO_COMMAND=$1
ARGUMENT_TWO=$2
ARGUMENT_THREE=$3

# Send some output to the display to show the user that all works (or doesn't) as expected
echo "Currently in buildDeploy.sh"
echo 'The value of HUGO_COMMAND (always the first build argument):' ${HUGO_COMMAND}
if [[ ! -z "$ARGUMENT_TWO" ]]
 then echo 'The value of the second build argument:' ${ARGUMENT_TWO}
else echo 'No second argument was submitted (not necessarily an error).'
fi
if [[ ! -z "$ARGUMENT_THREE" ]]
 then echo 'The value of the third build argument:' ${ARGUMENT_THREE}
else echo 'No third argument was submitted (not necessarily an error).'
fi

# Check if a 'deploy tier' argument was submitted, if so set the deployment bucket and url for Hugo to use
if [[ $ARGUMENT_TWO == 'prod' ]]
    then
    s3_bucket=labs-prod-website
    HUGO_BASEURL=https://labs.waterdata.usgs.gov/

elif [[ $ARGUMENT_TWO == 'qa' ]]
    then
    s3_bucket=labs-beta-website
    HUGO_BASEURL=https://lab-beta.waterdata.usgs.gov/

elif [[ $ARGUMENT_TWO == 'test' ]]
    then
    s3_bucket=labs-test-website
    HUGO_BASEURL=http://labs-test-website.s3-website-us-west-2.amazonaws.com/
else
    s3_bucket=labs-test-website
    HUGO_BASEURL=https://localhost:1313/
    echo "No valid deployment tier was submitted to application (not necessarily an error)."
fi

# run the script for the running Hugo
/bin/bash hugoCommand.sh $HUGO_COMMAND $HUGO_BASEURL

echo "Base url is " ${HUGO_BASEURL}


# Check if the command to deploy to AWS is present. If so, call the AWS script to do the deploy
if [[ $ARGUMENT_THREE == 'sync_yes' ]]
    then
     /bin/bash awsTierDeploy.sh $s3_bucket
     # Tell the user what Hugo will use as the base for generating URLs
     echo "Syncing to " ${s3_bucket}
fi
