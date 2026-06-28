#!/bin/bash

export SOURCE_VERSION="6.27"
export SOURCE_NAME=breeze-icons-${SOURCE_VERSION}.0
export SCRIPT_DIR=$(pwd)

download() {
	wget https://download.kde.org/stable/frameworks/${SOURCE_VERSION}/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-D BUILD_TESTING=OFF         \
		-D WITH_ICON_GENERATION=OFF  \
		-G Ninja ..
}

build() {
	ninja
}

install() {
	ninja install
}

