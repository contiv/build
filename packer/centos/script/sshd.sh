#!/bin/bash -eux

echo '==> Configuring sshd_config options'

echo '==> Turning off sshd DNS lookup to prevent timeout delay'
echo "UseDNS no" >> /etc/ssh/sshd_config
echo '==> Disablng GSSAPI authentication to prevent timeout delay'
echo "GSSAPIAuthentication no" >> /etc/ssh/sshd_config

echo "==> Setting MaxSessions to 1000. Needed for systemtests"
echo "MaxSessions 1000" >> /etc/ssh/sshd_config
echo "==> Setting MaxStartups to 100:100:100. Needed for systemtests"
echo "MaxStartups 100:100:100" >> /etc/ssh/sshd_config

echo "==> Turning off PAM, needed for systemtests"
sed -i -e 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
