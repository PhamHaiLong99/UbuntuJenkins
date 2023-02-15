#!/bin/bash
docker build -t ubuntu-test .
docker tag ubuntu-test:latest reg.longph.works/ubuntu-test
docker push reg.longph.works/ubuntu-test
echo "Going to sleep for waiting..."
sleep 2

echo "Deploy K8s"
kubectl apply -k .