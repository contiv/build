#!/bin/bash

set -xe

# enable docker for auto-restart, and cleanly shut it down
# before stopping the container
systemctl enable docker
systemctl stop docker

# cleanup any temp files created as part of provision
rm -rf /tmp/*
