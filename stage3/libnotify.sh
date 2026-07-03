#!/bin/bash

export SOURCE_VERSION="0.8.8"
export SOURCE_NAME=libnotify-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://download.gnome.org/sources/libnotify/0.8/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {	
	meson setup --prefix=/usr       \
            --buildtype=release \
	    -D gtk_doc=false    \
            -D man=false -D tests=false ..
}

build() {
	ninja
}

install() {
	ninja install
}

