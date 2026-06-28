#!/bin/bash

export SOURCE_VERSION="1.86.0"
export SOURCE_NAME=gjs-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://download.gnome.org/sources/gjs/1.86/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {	
	meson setup --prefix=/usr       \
            --buildtype=release \
            --wrap-mode=nofallback    \
	    ..
}

build() {
	ninja
}

install() {
	ninja install
}

