all:
	cd packer && make

vendor-ansible:
	git subtree pull --squash --prefix vendor/ansible https://github.com/contiv/ansible master
