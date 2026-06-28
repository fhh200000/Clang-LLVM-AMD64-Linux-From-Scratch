#!/bin/bash

export SOURCE_VERSION="3.4.0"
export SOURCE_NAME=libblockdev-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://github.com/storaged-project/libblockdev/releases/download/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {	
	../configure --prefix=/usr      \
            --sysconfdir=/etc  \
            --with-python3     \
            --without-escrow   \
            --without-gtk-doc  \
            --without-lvm      \
            --without-lvm_dbus \
            --without-nvdimm   \
            --without-tools
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

