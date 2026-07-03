#!/bin/bash

export SOURCE_VERSION="4.13.0"
export SOURCE_NAME=opencv-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://github.com/opencv/opencv/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
	wget https://github.com/opencv/opencv_contrib/archive/${SOURCE_VERSION}/opencv_contrib-${SOURCE_VERSION}.tar.gz
	pushd ${SOURCE_NAME}
	tar -xf ../opencv_contrib-${SOURCE_VERSION}.tar.gz
	popd
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr      \
		-D CMAKE_BUILD_TYPE=Release       \
		-D ENABLE_CXX11=ON                \
		-D BUILD_PERF_TESTS=OFF           \
		-D BUILD_TESTS=OFF                \
		-D ENABLE_PRECOMPILED_HEADERS=OFF \
		-D CMAKE_SKIP_INSTALL_RPATH=ON    \
		-D BUILD_WITH_DEBUG_INFO=OFF      \
		-D OPENCV_GENERATE_PKGCONFIG=ON   \
		-W no-dev  -G Ninja ..
}

build() {
	ninja
}

install() {
        ninja install
}

