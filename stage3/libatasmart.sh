#!/bin/bash

export SOURCE_VERSION="0.19"
export SOURCE_NAME=libatasmart-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://0pointer.de/public/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {	
	../configure --prefix=/usr    \
            --disable-static
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

