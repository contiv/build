all:
	cd packer && make

vendor-ansible:
	git subtree pull --prefix vendor/ansible https://github.com/contiv/ansible HEAD --squash
