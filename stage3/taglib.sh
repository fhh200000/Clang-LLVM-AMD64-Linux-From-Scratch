#!/bin/bash

export SOURCE_VERSION="2.2"
export SOURCE_NAME=taglib-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://taglib.org/releases/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release \
		-D BUILD_SHARED_LIBS=ON \
		-G Ninja ..
}

build() {
	ninja
}

install() {
	ninja install
}

