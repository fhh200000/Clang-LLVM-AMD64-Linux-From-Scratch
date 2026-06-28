#!/bin/bash

export SOURCE_VERSION="3.012"
export SOURCE_NAME=Business-ISBN-${SOURCE_VERSION}
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

