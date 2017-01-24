#!/bin/bash

echo "==> Backing up the Docker images"
mkdir /var/docker_images
cd /var/docker_images
images=$(sudo docker images | grep -v REPOSITORY | grep -v none | cut -d' ' -f1)
for image in $images; do
 echo $image
 docker save $image > ${image//\//-}.tar
done

echo "==> Stopping docker"
service docker stop
echo "==> Removing the Docker folder"
rm -rf /var/lib/docker/
