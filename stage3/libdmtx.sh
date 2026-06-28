#!/bin/bash

export SOURCE_VERSION="0.7.8"
export SOURCE_NAME=libdmtx-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://github.com/dmtx/libdmtx/archive/refs/tags/v${SOURCE_VERSION}.tar.gz -O ${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release  \
		-D DEFAULT_STATIC_LIBS=OFF \
		-W no-dev -G Ninja ..
}

build() {
	ninja
}

install() {
	ninja install
}

