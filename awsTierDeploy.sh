#!/bin/bash

URL=$1

aws s3 sync /src/public s3://${URL} --delete
echo "Ran AWS sync command"
