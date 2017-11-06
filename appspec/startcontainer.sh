#!/bin/bash
$(aws ecr get-login --region us-west-2 --no-include-email)
docker pull 993884755824.dkr.ecr.us-west-2.amazonaws.com/tstickney/pywebapp:latest || {
    echo "ERROR: docker pull failed. Sleeping for 10 minutes to allow investigation..."
    sleep 60
    exit 1
}
docker run --name pywebapp -p 80:8080 --detach 993884755824.dkr.ecr.us-west-2.amazonaws.com/tstickney/pywebapp:latest
