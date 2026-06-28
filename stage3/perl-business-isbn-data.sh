#!/bin/bash

export SOURCE_VERSION="20260214.001"
export SOURCE_NAME=Business-ISBN-Data-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://cpan.metacpan.org/authors/id/B/BR/BRIANDFOY/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {	
	pushd ..
	perl Makefile.PL
	ret=$?
	popd
	return $ret
}

build() {
	pushd ..
	make && make test
	ret=$?
	popd
	return $ret
}

install() {
	pushd ..
	make install
	ret=$?
	popd
	return $ret
}

