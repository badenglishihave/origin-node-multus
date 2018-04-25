#!/bin/sh
echo Building manndavidj/origin-node-multus:build

docker build -t manndavidj/origin-node-multus:build -f Dockerfile.build .

mkdir -p ./opt/cni/bin
docker container create --name extract manndavidj/origin-node-multus:build  
docker container cp extract:/usr/src/multus-cni/bin/multus ./opt/cni/bin/multus
PLUGINS=$(docker run -i -a stdout manndavidj/origin-node-multus:build /bin/bash -c "find /usr/src/plugins/bin -type f")
for plugin in $PLUGINS; do
        echo "Copying plugin $plugin"
	docker cp extract:$plugin ./opt/cni/bin || true
done
docker container rm -f extract

echo Building manndavidj/origin-node-multus:latest

docker build --no-cache -t manndavidj/origin-node-multus:latest .
rm -rf ./opt
