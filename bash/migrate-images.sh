#!/bin/bash

# IMPORTANT: make sure you have previously authenticated against your EC2 Container Registry prior to running this script

set +x

#REPOSITORY=3871-8830-8760.dkr.ecr.us-east-1.amazonaws.com
REPOSITORY=711226717742.dkr.ecr.us-east-1.amazonaws.com

# authenticate our Docker client with Amazon
$(aws ecr get-login --region us-east-1)

while IFS='' read -r line || [[ -n "$line" ]]; do
    PULL_COMMAND="docker pull $line"
    $PULL_COMMAND
    oldTag=$(cut -d ':' -f 2 <<< $line)
    noRegistry="${line#*/}"
    imageName="${noRegistry%:*}"
    CREATE_REPOSITORY_COMMAND="aws ecr create-repository --repository-name $imageName --region us-east-1"
    echo $CREATE_REPOSITORY_COMMAND
    $CREATE_REPOSITORY_COMMAND
    newTag="$REPOSITORY/$imageName:$oldTag"
    TAG_COMMAND="docker tag $line $newTag"
    echo $TAG_COMMAND
    $TAG_COMMAND
    PUSH_COMMAND="docker push $newTag"
    echo $PUSH_COMMAND
    $PUSH_COMMAND
    echo
    echo
done < "images-to-upload.txt"
