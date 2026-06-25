export SOURCE_VERSION=1.6.0
export SOURCE_NAME=libwebp-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://storage.googleapis.com/downloads.webmproject.org/releases/webp/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
	wget https://www.linuxfromscratch.org/patches/blfs/13.0/libheif-1.21.2-svt_av1_build_fix-1.patch
}

prebuild() {
	../configure --prefix=/usr           \
            --enable-libwebpmux     \
            --enable-libwebpdemux   \
            --enable-libwebpdecoder \
            --enable-libwebpextras  \
            --enable-swap-16bit-csp \
            --disable-static
}

build() {
	make
}

install() {
	make install
}

