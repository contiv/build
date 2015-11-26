all:
	cd packer && make

vendor-ansible:
	git subtree pull --prefix ansible https://github.com/contiv/ansible HEAD --squash
