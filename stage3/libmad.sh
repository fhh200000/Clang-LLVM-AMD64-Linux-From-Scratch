#!/bin/bash

export SOURCE_VERSION="0.15.1b"
export SOURCE_NAME=libmad-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://downloads.sourceforge.net/mad/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
	wget https://www.linuxfromscratch.org/patches/blfs/13.0/libmad-0.15.1b-fixes-1.patch
}

prebuild() {	
	pushd ..
	patch -Np1 -i ../libmad-0.15.1b-fixes-1.patch
	sed "s@AM_CONFIG_HEADER@AC_CONFIG_HEADERS@g" -i configure.ac
	touch NEWS AUTHORS ChangeLog
	autoreconf -fi
	popd
	../configure --prefix=/usr --disable-static
}

build() {
	make -j$(nproc)
}

install() {
	cat > /usr/lib/pkgconfig/mad.pc << "EOF"
prefix=/usr
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include

Name: mad
Description: MPEG audio decoder
Requires:
Version: 0.15.1b
Libs: -L${libdir} -lmad
Cflags: -I${includedir}
EOF
	make install
}

