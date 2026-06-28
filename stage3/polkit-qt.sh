#!/bin/bash

export SOURCE_VERSION="0.201.1"
export SOURCE_NAME=polkit-qt-1-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://download.kde.org/stable/polkit-qt-1/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release  \
		-D QT_MAJOR_VERSION=6      \
		-W no-dev -G Ninja ..
}

build() {
	ninja
}

install() {
	ninja install
}

