export SOURCE_VERSION=1.68.0
export SOURCE_NAME=nghttp2-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/nghttp2/nghttp2/releases/download/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	../configure --prefix=/usr     \
		--disable-static  \
		--enable-lib-only \
		--docdir=/usr/share/doc/nghttp2-1.68.0
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

