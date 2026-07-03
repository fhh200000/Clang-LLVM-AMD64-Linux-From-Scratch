#!/bin/bash

export SOURCE_VERSION="0.3.25"
export SOURCE_NAME=libxmlb-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://github.com/hughsie/libxmlb/releases/download/${SOURCE_VERSION}/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	meson setup --prefix=/usr --buildtype=release -D gtkdoc=false ..
}

build() {
	ninja
}

install() {
        ninja install
}

