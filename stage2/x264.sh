export SOURCE_VERSION=20250815
export SOURCE_NAME=x264-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget  https://anduin.linuxfromscratch.org/BLFS/x264/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	CC=cc CXX=c++ ../configure --prefix=/usr   \
		--enable-shared \
		--disable-cli
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

