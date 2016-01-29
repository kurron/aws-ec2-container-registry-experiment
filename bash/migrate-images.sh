#!/bin/bash

# IMPORTANT: make sure you have previously authenticated against your EC2 Container Registry prior to running this script

set +x

REPOSITORY=3871-8830-8760.dkr.ecr.us-east-1.amazonaws.com

while IFS='' read -r line || [[ -n "$line" ]]; do
    PULL_COMMAND="docker pull $line"
    echo "$PULL_COMMAND"
    oldTag=$(cut -d ':' -f 2 <<< $line)
    noRegistry="${line#*/}"
    imageName="${noRegistry%:*}"
    CREATE_REPOSITORY_COMMAND="aws ecr create-repository --repository-name $imageName --region $AWS_REGION"
    echo "$CREATE_REPOSITORY_COMMAND"
    newTag="$REPOSITORY/$imageName:$oldTag"
    TAG_COMMAND="docker tag $line $newTag"
    echo "$TAG_COMMAND"
    PUSH_COMMAND="docker push $newTag"
    echo "$PUSH_COMMAND"
    echo
    echo
done < "images-to-upload.txt"
