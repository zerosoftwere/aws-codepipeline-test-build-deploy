#!/bin/bash

image_id=$(docker images -q flask_app)
if [ -n "${image_id}" ]; then
    echo Removing image ${image_id}
    docker rmi ${image_id}
else
    echo No image found
fi