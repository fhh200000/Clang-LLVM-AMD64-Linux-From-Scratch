#!/bin/bash

export SOURCE_VERSION="4.0.9"
export SOURCE_NAME=utfcpp-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget  https://github.com/nemtrif/utfcpp/archive/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-G Ninja ..
}

build() {
	ninja
}

install() {
	ninja install
}

