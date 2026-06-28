#!/bin/bash

export SOURCE_VERSION="0.8.0"
export SOURCE_NAME=a52dec-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://distfiles.adelielinux.org/source/a52dec/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {	
	../configure --prefix=/usr           \
            --mandir=/usr/share/man \
            --enable-shared         \
            --disable-static        \
            CFLAGS="${CFLAGS:--g -O3} -fPIC"
}

build() {
	make -j$(nproc)
}

install() {
	make install &&
		cp ../liba52/a52_internal.h /usr/include/a52dec &&
		/usr/bin/install -v -m644 -D ../doc/liba52.txt \
		/usr/share/doc/liba52-0.8.0/liba52.txt
}

