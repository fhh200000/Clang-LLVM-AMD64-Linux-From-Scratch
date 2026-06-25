export SOURCE_VERSION=2.3.8
export SOURCE_NAME=libidn2-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://ftpmirror.gnu.org/libidn/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	../configure --prefix=/usr    \
		--disable-static
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

