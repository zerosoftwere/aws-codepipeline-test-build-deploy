#!/bin/bash

cd /home/ec2-user
echo "Working directory $(pwd)"

docker build -t flask_app .