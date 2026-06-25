export SOURCE_VERSION=1.1.7
export SOURCE_NAME=mtdev-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://bitmath.org/code/mtdev/${SOURCE_NAME}.tar.bz2
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

