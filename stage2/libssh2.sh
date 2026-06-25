export SOURCE_VERSION=1.11.1
export SOURCE_NAME=libssh2-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://www.libssh2.org/download/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	../configure --prefix=/usr          \
		--disable-docker-tests \
		--disable-static
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

