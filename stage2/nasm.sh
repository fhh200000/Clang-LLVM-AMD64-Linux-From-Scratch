export SOURCE_VERSION=3.01
export SOURCE_NAME=nasm-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://www.nasm.us/pub/nasm/releasebuilds/${SOURCE_VERSION}/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	../configure --prefix=/usr
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

