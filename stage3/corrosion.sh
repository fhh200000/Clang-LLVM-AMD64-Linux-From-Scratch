#!/bin/bash

export SOURCE_VERSION="0.6.1"
export SOURCE_NAME=corrosion-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://github.com/corrosion-rs/corrosion/archive/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {	
	cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release     \
		-D BUILD_TESTING=OFF            \
		-D QCORO_BUILD_EXAMPLES=OFF     \
		-D BUILD_SHARED_LIBS=ON         \
		-G Ninja .. 
}

build() {
	ninja
}

install() {
	ninja install
}

