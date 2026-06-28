#!/bin/bash

export SOURCE_VERSION="140.9.1"
export SOURCE_NAME="firefox-${SOURCE_VERSION}"
export SCRIPT_DIR=$(pwd)

download() {
	wget https://archive.mozilla.org/pub/firefox/releases/${SOURCE_VERSION}esr/source/${SOURCE_NAME}esr.source.tar.xz
	tar -xf ${SOURCE_NAME}esr.source.tar.xz
	wget https://www.linuxfromscratch.org/patches/blfs/13.0/spidermonkey-140.8.0-python_3.14_fixes-1.patch
}

prebuild() {	
	pushd ../
	patch -Np1 -i ../spidermonkey-140.8.0-python_3.14_fixes-1.patch
	patch -Np1 -i ${SCRIPT_DIR}/spidermonkey-fix-clang-rust-build.patch
	popd
	../js/src/configure --prefix=/usr            \
                    --disable-debug-symbols  \
                    --disable-jemalloc       \
                    --enable-readline        \
                    --enable-rust-simd       \
                    --with-intl-api          \
                    --with-system-icu        \
                    --with-system-zlib
}

build() {
	make -j$(nproc)
}

install() {
	make install && \
		rm -v /usr/lib/libjs_static.ajs &&
		sed -i '/@NSPR_CFLAGS@/d' /usr/bin/js140-config
		sed '$i#define XP_UNIX' -i /usr/include/mozjs-140/js-config.h
}

