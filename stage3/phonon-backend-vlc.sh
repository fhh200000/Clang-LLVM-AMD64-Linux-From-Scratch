#!/bin/bash

export SOURCE_VERSION="0.12.0"
export SOURCE_NAME=phonon-backend-vlc-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://download.kde.org/stable/phonon/phonon-backend-vlc/${SOURCE_VERSION}/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release  \
		-D PHONON_BUILD_QT5=OFF      \
		-W no-dev -G Ninja ..
}

build() {
	ninja
}

install() {
	ninja install
}

