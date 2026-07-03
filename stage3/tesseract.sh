#!/bin/bash

export SOURCE_VERSION="5.5.2"
export SOURCE_NAME=tesseract-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://github.com/tesseract-ocr/tesseract/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
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

