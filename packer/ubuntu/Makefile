all: stop build add start 

add:
	vagrant box add ubuntu1504 box/ubuntu1504-netplugin.box --force

start:
	vagrant up

stop:
	vagrant destroy -f

restart: stop start

build:
	version=$$(cat VERSION) atlas_token="dummy" packer build --only build --force ubuntu1504.json

release-build:
	changelog=${GITHUB_RELEASE_URL} version=$$(cat VERSION) atlas_token=${ATLAS_TOKEN} packer build --only release --force ubuntu1504.json

# XXX this is to work around a packer issue that causes the vbox startup to
# fail every time it's run after the first time.
rmcache:
	rm -rf packer_cache

ssh: start
	vagrant ssh
