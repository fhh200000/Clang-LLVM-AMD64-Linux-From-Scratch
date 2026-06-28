#!/bin/bash

export SOURCE_VERSION="7.5"
export SOURCE_NAME=smartmontools-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://downloads.sourceforge.net/smartmontools/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {	
	../configure --prefix=/usr      \
		--sysconfdir=/etc \
		--docdir=/usr/share/doc/${SOURCE_NAME}
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

