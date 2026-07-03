#!/bin/bash

export SOURCE_VERSION="2.8.0"
export SOURCE_NAME=geoclue-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://gitlab.freedesktop.org/geoclue/geoclue/-/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.bz2
	tar -xf ${SOURCE_NAME}.tar.bz2
}

prebuild() {	
	meson setup --prefix=/usr       \
            --buildtype=release \
	    -D gtk-doc=false    \
            -D nmea-source=false ..
}

build() {
	ninja
}

install() {
	ninja install
}

