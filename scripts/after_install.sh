#!/bin/bash

echo "Working directory $(pwd)"

env

docker ps -a
whoami

cat /home/ec2-user/Dockerfile

docker build -t flask_app -f Dockerfile /home/ec2-user/