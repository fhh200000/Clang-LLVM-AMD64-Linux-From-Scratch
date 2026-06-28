#!/bin/bash

export SOURCE_VERSION="20251204"
export SOURCE_NAME=blfs-systemd-units-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://www.linuxfromscratch.org/blfs/downloads/13.0-systemd/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	return 0
}

build() {
	return 0
}

install() {
	pushd ../../
	cp -Rf ${SOURCE_NAME} /usr/src/
	rm -rf /usr/src/${SOURCE_NAME}/build_stage3_blfs-systemd-units_${SOURCE_VERSION}
	mv /usr/src/${SOURCE_NAME} /usr/src/blfs-systemd-units
	popd
}

