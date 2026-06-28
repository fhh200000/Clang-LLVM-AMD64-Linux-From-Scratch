#!/bin/bash

export SOURCE_VERSION="2.03.38"
export SOURCE_NAME=LVM2.${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://sourceware.org/ftp/lvm2/${SOURCE_NAME}.tgz
	tar -xf ${SOURCE_NAME}.tgz
}

prebuild() {	
	../configure --prefix=/usr       \
            --enable-cmdlib     \
            --enable-pkgconfig  \
            --enable-udev_sync
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

