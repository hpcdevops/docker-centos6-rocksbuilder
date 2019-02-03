# Rocks Builder on CentOS 6 Docker Image

This is a [Rocks](https://rocksclusters.org/) development appliance.

This container provides a base install of the required software and configuration
required to build Rocks application rolls. It does not currently support building
of Rocks system rolls.

## Usage

There are multiple
[tags](https://hub.docker.com/r/hpcdevops/docker-centos6-rocksbuilder/tags/)
available.  To use the latest available image, run:

```
docker pull hpcdevops/docker-centos6-rocksbuilder:latest
docker run -it -h rocksbuilder hpcdevops/docker-centos6-rocksbuilder:latest
```

The above command will drop you into a bash shell inside the container.

## Notes

> **Important Note**: This image is used for testing and development.  It is
> not suited for any production use.

