export SOURCE_VERSION=1.3.6
export SOURCE_NAME=libogg-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://downloads.xiph.org/releases/ogg/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	../configure --prefix=/usr    \
		--disable-static \
		--docdir=/usr/share/doc/${SOURCE_NAME}
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

