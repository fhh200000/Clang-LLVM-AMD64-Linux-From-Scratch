#!/bin/bash

export SOURCE_VERSION="0.26"
export SOURCE_NAME=desktop-file-utils-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget  https://www.freedesktop.org/software/desktop-file-utils/releases/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
	wget https://www.linuxfromscratch.org/patches/blfs/13.0/libmad-0.15.1b-fixes-1.patch
}

prebuild() {	
	meson setup --prefix=/usr --buildtype=release ..
}

build() {
	ninja
}

install() {
	ninja install
}

