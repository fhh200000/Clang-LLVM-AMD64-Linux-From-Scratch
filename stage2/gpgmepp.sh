export SOURCE_VERSION=2.0.0
export SOURCE_NAME=gpgmepp-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://www.gnupg.org/ftp/gcrypt/gpgmepp/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
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

