#!/bin/bash

export SOURCE_VERSION="3.0.2"
export SOURCE_NAME=zxing-cpp-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://github.com/zxing-cpp/zxing-cpp/releases/download/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {	
	cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-D ZXING_C_API=OFF           \
		-D ZXING_EXAMPLES=OFF        \
		-D ZXING_WRITERS=BOTH        \
		-W no-dev .. 
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

