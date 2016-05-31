FROM centos:7

# This Dockerfile is used to build the contiv/centos-systemd image, used by the packer script.
# This is based on the Dockerfile sample here:
# https://github.com/docker-library/docs/tree/master/centos#dockerfile-for-systemd-base-image
MAINTAINER "Madhav Puri" <mapuri@cisco.com>

ENV container docker

RUN (cd /lib/systemd/system/sysinit.target.wants/; \
for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/usr/sbin/init"]
