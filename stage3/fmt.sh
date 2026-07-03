#!/bin/bash

export SOURCE_VERSION="12.1.0"
export SOURCE_NAME=fmt-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://github.com/fmtlib/fmt/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {	
	cmake -D CMAKE_INSTALL_PREFIX=/usr     \
		-D CMAKE_INSTALL_LIBDIR=/usr/lib \
		-D BUILD_SHARED_LIBS=ON          \
		-D FMT_TEST=OFF                  \
		-G Ninja .. 
}

build() {
	ninja
}

install() {
	ninja install
}

