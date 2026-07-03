#!/bin/bash

export SOURCE_VERSION="1.20.3"
export SOURCE_NAME=xdg-desktop-portal-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://github.com/flatpak/xdg-desktop-portal/releases/download/${SOURCE_VERSION}/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	meson setup --prefix=/usr --buildtype=release -D tests=disabled ..
}

build() {
	ninja
}

install() {
        ninja install
}

