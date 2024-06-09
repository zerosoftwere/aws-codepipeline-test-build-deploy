#!/bin/bash

ehco "Working directory $(pwd)"
docker build -t flask_app -f Dockerfile /home/ec2-user/