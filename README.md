## Packer and Ansible tools for building (netplugin,volplugin) images

Things you will need:

* Packer 0.8.x
* Ansible 1.9.x
* VirtualBox 5.0.x

### filesystem layout

* `packer`: in here lives packer templates.
  * `centos`
  * `ubuntu`
* `vendor`: carried code from other repositories
  * `ansible`: in here lives the ansible that powers all the images.

Type `make` in any of the packer subdirectories to build and publish an image.
Typing `make` at the `packer` level will build all the images.
