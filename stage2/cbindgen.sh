#!/bin/bash

export SOURCE_VERSION=0.29.2
export SOURCE_NAME=cbindgen-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://github.com/mozilla/cbindgen/archive/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
        tar -xf ${SOURCE_NAME}.tar.gz
	return 0
}

prebuild() {
	return 0
}

build() {
	pushd ..
	cargo build --release
	ret=$?
	popd
	return $ret
}

install() {
	cp -fiv ../target/release/cbindgen /usr/bin/
	return 0
}
