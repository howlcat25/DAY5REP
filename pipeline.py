
# s3 cp 

#sys args
# main
# dev, staging, prod 

import os
import sys
import argparse
import random 


dockerimg = "redis"    #base img
dockertag = "latest"

def startpipeline():
    pull_command = f"docker pull {dockerimg}:{dockertag}"
    os.system(pull_command)

    build_command = "docker build ."
    os.system(build_command)
    os.system('docker login')

    push_command = f"docker push {dockerimg}:{dockertag}"
    os.system(push_command)

    # push_command = f"docker push {dockerimg}:{dockertag}"
    # os.system(push_command)
    

    os.system('aws s3 cp dockerfile s3://containerb123/dockerfile ')

    print("Docker image created")

startpipeline()