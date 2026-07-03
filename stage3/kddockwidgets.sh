#!/bin/bash

export SOURCE_VERSION="2.4.0"
export SOURCE_NAME=KDDockWidgets-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://github.com/KDAB/KDDockWidgets/releases/download/v${SOURCE_VERSION}/kddockwidgets-${SOURCE_VERSION}.tar.gz
	tar -xf kddockwidgets-${SOURCE_VERSION}.tar.gz
}

prebuild() {
	sed -i "s/QT_VERSION >= QT_VERSION_CHECK(6, 0, 0) && defined(Q_OS_LINUX)/0/g" ../src/qtwidgets/views/ClassicIndicatorsWindow.cpp 
	cmake -D CMAKE_INSTALL_PREFIX=/usr     \
		-D CMAKE_BUILD_TYPE=Release                  \
		-D KDDockWidgets_X11EXTRAS=OFF   \
		-G Ninja .. 
}

build() {
	ninja
}

install() {
	ninja install
}

