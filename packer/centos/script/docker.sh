#!/bin/bash

if [[ ! "$DOCKER" =~ ^(true|yes|on|1|TRUE|YES|ON])$ ]]; then
  exit
fi

echo "==> Run the Docker installation script"
curl -sSL https://get.docker.com | sh

echo "==> Create the docker group"
# Add the docker group if it doesn't already exist
groupadd docker

echo "==> Add the connected "${USER}" to the docker group."
gpasswd -a ${USER} docker
gpasswd -a ${SSH_USERNAME} docker

service docker stop
echo "==> Cleaning up Docker directory"
rm -rf /var/lib/docker/*
echo "==> Configuring Docker daemon"
sed -i "s/daemon -H/daemon -s overlay -H/g" /usr/lib/systemd/system/docker.service
systemctl daemon-reload
echo "==> Starting docker"
service docker start
echo "==> Enabling docker to start on reboot"
chkconfig docker on
