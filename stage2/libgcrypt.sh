export SOURCE_VERSION=1.12.0
export SOURCE_NAME=libgcrypt-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://www.gnupg.org/ftp/gcrypt/libgcrypt/${SOURCE_NAME}.tar.bz2
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

