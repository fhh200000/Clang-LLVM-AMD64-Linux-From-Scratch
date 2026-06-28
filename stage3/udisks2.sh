#!/bin/bash

export SOURCE_VERSION="2.11.1"
export SOURCE_NAME=udisks-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://github.com/storaged-project/udisks/releases/download/${SOURCE_NAME}/${SOURCE_NAME}.tar.bz2
	tar -xf ${SOURCE_NAME}.tar.bz2
}

prebuild() {	
	../configure --prefix=/usr        \
            --sysconfdir=/etc    \
            --localstatedir=/var \
            --disable-static     \
            --enable-available-modules   \
	    enable_man=no
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

