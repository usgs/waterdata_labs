#!/bin/bash

URL=$1

aws s3 rm s3://${URL} --recursive --exclude "test-lookups/*"
echo "Cleaned bucket prior to deployment."
aws s3 sync /src/public s3://${URL}
echo "Ran AWS sync command."
