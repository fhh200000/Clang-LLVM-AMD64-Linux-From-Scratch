#!/bin/bash

export SOURCE_VERSION="3.0.23"
export SOURCE_NAME=vlc-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://download.videolan.org/vlc/${SOURCE_VERSION}/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {	
	sed -i 's/gstvideopool.h/video.h/' ../modules/codec/gstreamer/gstvlcvideopool.h
	BUILDCC=cc ../configure --prefix=/usr --disable-xcb 
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

