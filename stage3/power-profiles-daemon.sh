#!/bin/bash

export SOURCE_VERSION="0.30"
export SOURCE_NAME=power-profiles-daemon-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://gitlab.freedesktop.org/upower/power-profiles-daemon/-/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {	
	meson setup --prefix=/usr            \
            --buildtype=release      \
            -D gtk_doc=false         \
	    -D tests=false ..
}

build() {
	ninja
}

install() {
	ninja install
}

