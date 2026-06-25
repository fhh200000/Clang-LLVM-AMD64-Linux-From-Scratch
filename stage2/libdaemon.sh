export SOURCE_VERSION=0.14
export SOURCE_NAME=libdaemon-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://0pointer.de/lennart/projects/libdaemon/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	../configure --prefix=/usr --disable-static
}

build() {
	make -j$(nproc)
}

install() {
	make docdir=/usr/share/doc/${SOURCE_NAME} install
}

