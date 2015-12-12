#!/bin/bash -eux

echo "UseDNS no" >> /etc/ssh/sshd_config
echo "MaxSessions 1000" >> /etc/ssh/sshd_config
echo "MaxStartups 100:100:100" >> /etc/ssh/sshd_config
