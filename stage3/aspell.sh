#!/bin/bash

export SOURCE_VERSION="0.60.8.2"
export SOURCE_NAME=aspell-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://ftpmirror.gnu.org/aspell/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
	wget https://ftpmirror.gnu.org/aspell/dict/en/aspell6-en-2020.12.07-0.tar.bz2
}

prebuild() {	
	../configure --prefix=/usr
}

build() {
	make -j$(nproc)
}

install() {
	make install && 
		ln -svfn aspell-0.60 /usr/lib/aspell &&
		/usr/bin/install -v -m 755 ../scripts/ispell /usr/bin/ &&
		/usr/bin/install -v -m 755 ../scripts/spell /usr/bin/
	ret=$?
	if [ $ret -eq 0 ];then
		return $ret
	fi

	tar xf ../../aspell6-en-2020.12.07-0.tar.bz2 &&
		cd aspell6-en-2020.12.07-0                &&
	./configure &&
		make &&
		make install
}

