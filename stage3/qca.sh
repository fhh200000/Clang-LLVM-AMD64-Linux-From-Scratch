#!/bin/bash

export SOURCE_VERSION="2.3.10"
export SOURCE_NAME=qca-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://download.kde.org/stable/qca/${SOURCE_VERSION}/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {	
	sed -i 's@cert.pem@certs/ca-bundle.crt@' ../CMakeLists.txt
	cmake -D CMAKE_INSTALL_PREFIX=/usr            \
      -D CMAKE_BUILD_TYPE=Release                \
      -D QT6=ON                                  \
      -D QCA_INSTALL_IN_QT_PREFIX=ON             \
      -D QCA_MAN_INSTALL_DIR:PATH=/usr/share/man \
      ..
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

