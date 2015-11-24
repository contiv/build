#!/bin/bash -eux

SSH_USER=${SSH_USERNAME:-vagrant}
SSH_USER_HOME=${SSH_USER_HOME:-/home/${SSH_USER}}

echo "==> Installing VirtualBox guest additions"
# Assume that we've installed all the prerequisites:
# kernel-headers-$(uname -r) kernel-devel-$(uname -r) gcc make perl
# from the install media via ks.cfg

mount -o loop $SSH_USER_HOME/VBoxGuestAdditions.iso /mnt
sh /mnt/VBoxLinuxAdditions.run --nox11
umount /mnt
rm -rf $SSH_USER_HOME/VBoxGuestAdditions.iso
