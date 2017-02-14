all: stop build add start 

add:
	vagrant box add contiv/centos73 box/centos73.virtualbox.box --force --provider virtualbox

start:
	vagrant up

stop:
	vagrant destroy -f

build:
	version=$$(cat VERSION) atlas_token="dummy" packer build --only build-virtualbox --force centos73.json

release-build:
	changelog=${GITHUB_RELEASE_URL} version=$$(cat VERSION) atlas_token=${ATLAS_TOKEN} packer build --only release-virtualbox --force centos73.json

ssh: start
	vagrant ssh
