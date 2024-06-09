#!/bin/bash

container_id=$(docker ps -q --filter 'name=flask_app')
if [ -n "${container_id}" ]; then
    echo Removing container ${image_id}
    docker stop ${container_id}
    docker rm ${container_id}
else
    echo No container found
fi