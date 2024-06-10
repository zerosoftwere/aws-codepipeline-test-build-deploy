#!/bin/bash

sleep 30

status_code=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8000/health)

if [ "$status_code" -eq 200 ]; then
  echo "Application is running successfully."
  exit 0
else
  echo "Application is not running. Status code: $status_code"
  exit 1
fi