#!/bin/bash

env

docker ps -a
docker run --name flask_app -d -p 8000:80 flash_app