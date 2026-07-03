#!/bin/bash

export SOURCE_VERSION="2.10.3"
export SOURCE_NAME=cracklib-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://github.com/cracklib/cracklib/releases/download/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	export PATH=$PATH:$(realpath overlay)
	../configure --prefix=/usr                      \
		--disable-static                   \
		--with-default-dict=/usr/lib/cracklib/pw_dict
}

build() {
	make -j$(nproc)
}

install() {
        make install
}

