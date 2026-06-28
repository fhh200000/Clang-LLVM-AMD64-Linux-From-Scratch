#!/bin/bash

export SOURCE_VERSION="0.21.7"
export SOURCE_NAME=libsecret-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://download.gnome.org/sources/libsecret/0.21/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {	
	meson setup --prefix=/usr       \
            --buildtype=release \
            -D gtk_doc=false    \
            -D manpage=false ..
}

build() {
	ninja
}

install() {
	ninja install
}

