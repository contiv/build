VERSION ?= $(shell git describe --tags --always)
PREVIOUS_VERSION ?= $(shell git describe --abbrev=0 --tags $(VERSION)^)
GITHUB_RELEASE_URL ?= https://github.com/contiv/build/releases/tag/$(VERSION)

all: stop build add start 

add:
	vagrant box add contiv/centos73 box/centos73.virtualbox.box --force --provider virtualbox

start:
	vagrant up

stop:
	vagrant destroy -f

ssh: start
	vagrant ssh

# .SHELLSTATUS doesn't seem to work as advertised, so we don't have a proper way to check if the git command failed
# (for example because git is not installed).  Therefore the next best thing is just to see if it was set to anything.
check-version:
	test -n "$(VERSION)"
	test -n "$(PREVIOUS_TAG)"

build: check-version
	version="$(VERSION)" atlas_token="dummy" packer build -color=false --only build-virtualbox --force centos73.json

release-build: check-version
	changelog="$(GITHUB_RELEASE_URL)" version="$(VERSION)" atlas_token="$(ATLAS_TOKEN)" packer build --only release-virtualbox --force centos73.json

release-github: check-version
	github-release -v release -p -r build -t "$(VERSION)" -d "**Changelog**<br/> $$(git log --oneline --no-merges --reverse $(PREVIOUS_VERSION)..$(VERSION))"
