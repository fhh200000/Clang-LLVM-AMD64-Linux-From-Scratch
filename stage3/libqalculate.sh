#!/bin/bash

export SOURCE_VERSION="5.9.0"
export SOURCE_NAME=libqalculate-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://github.com/Qalculate/libqalculate/releases/download/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	../configure --prefix=/usr    \
		--disable-static \
		--docdir=/usr/share/doc/${SOURCE_NAME}
}

build() {
	make -j$(nproc)
}

install() {
        make install && rm -v /usr/lib/libqalculate.la
}

