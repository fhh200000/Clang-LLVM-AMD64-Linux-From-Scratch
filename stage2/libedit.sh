export SOURCE_VERSION=20260512-3.1
export SOURCE_NAME=libedit-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://thrysoee.dk/editline/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	../configure --prefix=/usr --disable-static --enable-shared
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

