#!/bin/bash
docker build -t ubuntu-test .
docker tag ubuntu-test:latest reg.longph.works/ubuntu-test
docker push reg.longph.works/ubuntu-test

sleep 2


kubectl apply -k .