#!/bin/bash

export SOURCE_VERSION="1.21.0"
export SOURCE_NAME=plasma-wayland-protocols-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://download.kde.org/stable/plasma-wayland-protocols/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-W no-dev -G Ninja ..
}

build() {
	ninja
}

install() {
	ninja install
}

