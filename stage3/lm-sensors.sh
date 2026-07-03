#!/bin/bash

export SOURCE_VERSION="3-6-2"
export SOURCE_NAME=lm-sensors-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://github.com/hramrach/lm-sensors/archive/V${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	sed -i 's/gcc/cc/g' ../Makefile
	return 0
}

build() {
	pushd ..
	CC=cc make PREFIX=/usr        \
		BUILD_STATIC_LIB=0 \
		MANDIR=/usr/share/man
	ret=$?
	popd
	return $ret
}

install() {
	pushd ..
	CC=cc make PREFIX=/usr        \
		BUILD_STATIC_LIB=0 \
		MANDIR=/usr/share/man install
	ret=$?
	popd
	return $ret
}

