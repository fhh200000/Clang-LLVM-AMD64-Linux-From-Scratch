export SOURCE_VERSION=1.34.6
export SOURCE_NAME=c-ares-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/c-ares/c-ares/releases/download/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr ..
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

