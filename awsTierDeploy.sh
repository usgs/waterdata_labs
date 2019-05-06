#!/bin/bash

URL=$1

aws s3 sync /src/public s3://${URL} --delete

echo "testing" > testing.txt

aws s3 sync testing.txt s3://${URL} --delete
