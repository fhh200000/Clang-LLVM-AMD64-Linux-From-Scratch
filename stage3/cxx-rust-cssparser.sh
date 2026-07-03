#!/bin/bash

export SOURCE_VERSION="1.0.0"
export SOURCE_NAME=cxx-rust-cssparser-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://github.com/KDE/cxx-rust-cssparser/archive/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {	
	cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release     \
		-D BUILD_TESTING=OFF            \
		-D BUILD_SHARED_LIBS=ON         \
		-G Ninja .. 
}

build() {
	ninja
}

install() {
	ninja install
}

