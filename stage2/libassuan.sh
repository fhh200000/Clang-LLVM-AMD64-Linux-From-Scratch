export SOURCE_VERSION=3.0.2
export SOURCE_NAME=libassuan-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://www.gnupg.org/ftp/gcrypt/libassuan/${SOURCE_NAME}.tar.bz2
	tar -xf ${SOURCE_NAME}.tar.bz2
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

