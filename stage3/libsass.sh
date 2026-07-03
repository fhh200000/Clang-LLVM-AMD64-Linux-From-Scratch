#!/bin/bash

export SOURCE_VERSION="3.6.2"
export SOURCE_NAME=sassc-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://github.com/sass/sassc/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
	wget https://github.com/sass/libsass/archive/3.6.6/libsass-3.6.6.tar.gz
	pushd ${SOURCE_NAME}
	tar -xf ../libsass-3.6.6.tar.gz
	popd
}

prebuild() {
	pushd ../libsass-3.6.6
	autoreconf -fi
	./configure --prefix=/usr --disable-static && make -j$(nproc) && make install
	ret=$?
	if [ $ret -ne 0 ]; then
		return $ret
	fi
	cd ..
	autoreconf -fi
	popd
	../configure --prefix=/usr
}

build() {
	make -j$(nproc)
}

install() {
        make install
}

