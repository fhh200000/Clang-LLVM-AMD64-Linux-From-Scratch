#!/bin/bash

export SOURCE_VERSION=0.72.1
export SOURCE_NAME=rust-bindgen-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://github.com/rust-lang/rust-bindgen/archive/refs/tags/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
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
	cp -fiv ../target/release/bindgen /usr/bin
	return 0
}
