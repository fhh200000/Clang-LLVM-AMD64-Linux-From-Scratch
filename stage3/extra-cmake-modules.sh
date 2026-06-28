#!/bin/bash

export SOURCE_VERSION="6.27"
export SOURCE_NAME=extra-cmake-modules-${SOURCE_VERSION}.0
export SCRIPT_DIR=$(pwd)

download() {
	wget https://download.kde.org/stable/frameworks/${SOURCE_VERSION}/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	sed -i '/"lib64"/s/64//' ../kde-modules/KDEInstallDirsCommon.cmake
	sed -e '/PACKAGE_INIT/i set(SAVE_PACKAGE_PREFIX_DIR "${PACKAGE_PREFIX_DIR}")' \
		-e '/^include/a set(PACKAGE_PREFIX_DIR "${SAVE_PACKAGE_PREFIX_DIR}")' \
		-i ../ECMConfig.cmake.in
	cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-D BUILD_WITH_QT6=ON         \
		-D DOC_INSTALL_DIR=/usr/share/doc/${SOURCE_NAME} \
		-G Ninja ..
}

build() {
	ninja
}

install() {
	ninja install
}

