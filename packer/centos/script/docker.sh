#!/bin/bash

echo "==> Adding EPEL repo"
yum install -y epel-release
cat /etc/resolv.conf
cat /etc/redhat-release

curl https://get.docker.com | sudo -E bash
curl https://get.docker.com/builds/Linux/x86_64/docker-1.9.0 -o /usr/bin/docker

# Add the connected "${USER}" to the docker group.
gpasswd -a ${USER} docker
gpasswd -a ${SSH_USERNAME} docker

echo ". /etc/profile.d/envvar.sh" >>/etc/sysconfig/docker

echo "==> Starting docker"
service docker start
echo "==> Enabling docker to start on reboot"
chkconfig docker on
