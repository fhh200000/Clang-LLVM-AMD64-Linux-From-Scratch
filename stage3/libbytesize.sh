#!/bin/bash

export SOURCE_VERSION="2.12"
export SOURCE_NAME=libbytesize-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://github.com/storaged-project/libbytesize/releases/download/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {	
	../configure --prefix=/usr
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

