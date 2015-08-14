all: stop build add start 

add:
	vagrant box add centos71 box/centos71.box --force

start:
	vagrant up

stop:
	vagrant destroy -f

build:
	packer build --force centos71.json

ssh: start
	vagrant ssh
