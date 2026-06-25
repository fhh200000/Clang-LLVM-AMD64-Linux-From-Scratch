export SOURCE_VERSION=1.0.29
export SOURCE_NAME=libusb-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/libusb/libusb/releases/download/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.bz2
	tar -xf ${SOURCE_NAME}.tar.bz2
}

prebuild() {
	../configure --prefix=/usr --disable-static
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

