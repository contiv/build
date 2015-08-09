## Packer Configurations

Configurations for `centos` and `ubuntu` are available. To build them
simultaneously, build with `make`. Alternatively, `build-#` targets are
available, which will build each one independently (replace `#` with the os
type).

## Notes on configuration

* Release docker (latest version) is installed on all hosts
* Care was taken to ensure kernel versions are similar. 4.1 is currently used
  as of this writing. This is to ensure we are compatible with all features of
  docker.
* You will want ansible on your host. Install with `pip install ansible`,
  typically as root.
