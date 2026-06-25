export SOURCE_VERSION=3.12.0
export SOURCE_NAME=libnl-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/thom311/libnl/releases/download/libnl3_12_0/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	../configure --prefix=/usr     \
		--sysconfdir=/etc \
		--disable-static 
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

