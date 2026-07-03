#!/bin/bash

export SOURCE_VERSION="1.1.2"
export SOURCE_NAME=AppStream-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget  https://www.freedesktop.org/software/appstream/releases/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {	
	meson setup --prefix=/usr            \
            --buildtype=release      \
            -D apidocs=false         \
            -D bash-completion=false \
            -D stemming=false        \
	    -D man=false ..
}

build() {
	ninja
}

install() {
	ninja install
}

