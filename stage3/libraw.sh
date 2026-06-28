#!/bin/bash

export SOURCE_VERSION="0.22.0"
export SOURCE_NAME=LibRaw-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://www.libraw.org/data/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {	
	../configure --prefix=/usr    \
            --enable-jpeg    \
            --enable-jasper  \
            --enable-lcms    \
            --disable-static \
            --docdir=/usr/share/doc/libraw-0.22.0
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

