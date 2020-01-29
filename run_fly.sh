#!/bin/bash

./fly -v
./fly --target build login --concourse-url http://127.0.0.1:8080 -u admin -p admin
./fly --target build sync
./fly -t build set-pipeline -c pipeline.yaml -p aws-quickstart-linux-bastion
./fly -t build unpause-pipeline -p aws-quickstart-linux-bastion
./fly -t build unpause-job --job aws-quickstart-linux-bastion/job-hello-world
./fly -t build unpause-job --job aws-quickstart-linux-bastion/job-hello-world
./fly -t build trigger-job --job aws-quickstart-linux-bastion/job-hello-world
