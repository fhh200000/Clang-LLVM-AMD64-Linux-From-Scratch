#!/bin/bash

export SOURCE_VERSION="2.8.4"
export SOURCE_NAME=cryptsetup-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://www.kernel.org/pub/linux/utils/cryptsetup/v2.8/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {	
	../configure --prefix=/usr       \
            --disable-ssh-token \
            --disable-asciidoc
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

