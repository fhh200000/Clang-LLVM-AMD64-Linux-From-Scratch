export SOURCE_VERSION=2.2
export SOURCE_NAME=sbc-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://www.kernel.org/pub/linux/bluetooth/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	../configure --prefix=/usr --disable-static --disable-tester
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

