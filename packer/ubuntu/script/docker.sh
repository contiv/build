#!/bin/bash

# Add the Docker repository to your apt sources list.
echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list
# Add the Docker repository GPG key
curl -s https://get.docker.com/gpg | apt-key add -

# Update your sources
apt-get update

# Install Docker
apt-get install -y lxc-docker

# Enable memory and swap accounting
sed -i 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"/' /etc/default/grub
update-grub

# reboot
echo "Rebooting the machine..."
reboot
sleep 60

docker_package_install
gpasswd -a vagrant docker
give_docker_non_root_access
