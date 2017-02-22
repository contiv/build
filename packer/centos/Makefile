all: stop build add start 

add:
	vagrant box add contiv/centos73 box/centos73.virtualbox.box --force --provider virtualbox

start:
	vagrant up

stop:
	vagrant destroy -f

build:
	echo "ok"

ssh: start
	vagrant ssh
