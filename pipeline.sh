#!/bin/bash

# Check if the correct number of command-line arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <docker_image_name> <docker_image_tag>"
    exit 1
fi

# Get the command-line arguments
dockerimg="$1"
dockertag="$2"

startpipeline() {
    pull_command="docker pull ${dockerimg}:${dockertag}"
    eval "$pull_command"

    build_command="docker build ."
    eval "$build_command"
    docker login

    push_command="docker push ${dockerimg}:${dockertag}"
    eval "$push_command"

    aws s3 cp dockerfile s3://containerb123/dockerfile

    echo "Docker image created"
}

startpipeline