#!/bin/bash

export SOURCE_VERSION="r62"
export SOURCE_NAME=inih-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://github.com/benhoyt/inih/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {	
	meson setup --prefix=/usr --buildtype=release ..
}

build() {
	ninja
}

install() {
	ninja install
}

