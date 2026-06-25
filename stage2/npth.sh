export SOURCE_VERSION=1.8
export SOURCE_NAME=npth-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://www.gnupg.org/ftp/gcrypt/npth/${SOURCE_NAME}.tar.bz2
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

