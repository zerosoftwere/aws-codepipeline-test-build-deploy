#!/bin/bash

echo "Working directory $(pwd)"

env

docker ps -a
whoami

docker build -t flask_app -f Dockerfile /home/ec2-user/