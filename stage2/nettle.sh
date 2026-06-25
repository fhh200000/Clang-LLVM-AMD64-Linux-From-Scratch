export SOURCE_VERSION=3.10.2
export SOURCE_NAME=nettle-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://ftpmirror.gnu.org/nettle/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	../configure --prefix=/usr --disable-static
}

build() {
	make -j$(nproc)
}

install() {
	make install &&
	chmod -v 755 /usr/lib/lib{hogweed,nettle}.so
}

