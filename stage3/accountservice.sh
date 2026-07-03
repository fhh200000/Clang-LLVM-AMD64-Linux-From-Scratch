#!/bin/bash

export SOURCE_VERSION="23.13.9"
export SOURCE_NAME=accountsservice-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://www.freedesktop.org/software/accountsservice/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	meson setup --prefix=/usr --buildtype=release -D admin_group=adm ..
}

build() {
	ninja
}

install() {
        ninja install
}

