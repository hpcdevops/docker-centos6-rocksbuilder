# Rocks Builder for Rocks/CentOS 6

[![Docker Build Status](https://img.shields.io/docker/build/hpcdevops/docker-centos6-rocksbuilder.svg)](https://hub.docker.com/r/hpcdevops/docker-centos6-rocksbuilder/builds/)
[![Docker Automated build](https://img.shields.io/docker/automated/hpcdevops/docker-centos6-rocksbuilder.svg)](https://hub.docker.com/r/hpcdevops/docker-centos6-rocksbuilder/)
[![Docker Pulls](https://img.shields.io/docker/pulls/hpcdevops/docker-centos6-rocksbuilder.svg)](https://hub.docker.com/r/hpcdevops/docker-centos6-rocksbuilder/)


The Rocks Builder for Rocks/CentOS 6 is Docker container that encapsulates the 
capbilities of a [Rocks](https://rocksclusters.org/) development appliance of
Rocks 6.2 (SideWinder).

The container provides a base install of the required software and configuration
required to build Rocks application rolls for Rocks/CentOS 6.

It does not support building Rocks system rolls.

## Running Rocks Builder for Rocks/CentOS 6

The docker-centos6-rocksbuilder is packaged to be able to build Rocks 
application rolls primarily for the purpose of integration into a Continuous
Integration system like Travis/CI that is integrated with a version control
system like Github.

The default behavior of Rocks was modified slightly to allow building as
a non-root user using this container. As such, some Rocks application roll
build semantics (like BIND mounting the INSTALL dir) are not supported in
this version of the builder.

The easiest way to run the Rocks Builder for Rocks/CentOS 6 is by running
with our pre-built container:

	docker run --rm -it \
		-e "container=docker" \
		-h rocksbuilder \
		-v "$(pwd):/export/rocks/src/roll" \
		-w "/export/rocks/src/roll" \
		hpcdevops/docker-centos6-rocksbuilder:latest \
		bash -exc ' \
			mkdir -p /tmp/$(pwd) && \
			tar -cf - . | ( cd /tmp/$(pwd) ; tar -xf - ) && \
			pushd /tmp/$(pwd)/$(ls -1) && \
			make
		'

...where `$(pwd)` is a directory containing the source of a Rocks
application roll such as that created by cloning an SDSC Rocks
Application roll like this...

	$ git clone --depth=50 https://github.com/hpcdevops/sdsc-roll.git
	Cloning into 'sdsc-roll'...
	remote: Enumerating objects: 480, done.
	remote: Counting objects: 100% (480/480), done.
	remote: Compressing objects: 100% (207/207), done.
	remote: Total 480 (delta 299), reused 432 (delta 266), pack-reused 0
	Receiving objects: 100% (480/480), 84.60 KiB | 0 bytes/s, done.
	Resolving deltas: 100% (299/299), done.

	$ chmod -R g+rwX,o+rwX ./sdsc-roll


## Notes

> **Important Note**: This image is used for testing and development.  It is
> not suited for any production use.

