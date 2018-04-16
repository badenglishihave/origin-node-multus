#!/bin/sh
echo Building badenglishihave/origin-node-multus:build

docker build -t badenglishihave/origin-node-multus:build -f Dockerfile.build .

mkdir -p ./opt/cni
docker container create --name extract badenglishihave/origin-node-multus:build  
docker container cp extract:/usr/src/multus-cni/bin/multus ./opt/cni/bin/
docker container cp extract:/usr/src/plugins/bin/* ./opt/cni/bin/
docker container rm -f extract

echo Building badenglishihave/origin-node-multus:latest

docker build --no-cache -t badenglishihave/origin-node-multus:latest .
rm -rf ./opt
