#!/bin/bash

export SOURCE_VERSION="0.3.113"
export SOURCE_NAME=libaio-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://pagure.io/libaio/archive/${SOURCE_NAME}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {	
	sed -i '/install.*libaio.a/s/^/#/' ../src/Makefile
}

build() {
	pushd ..
	make
	ret=$?
	popd
	return $ret
}

install() {
	pushd ..
	make install
	ret=$?
	popd
	return $ret
}

