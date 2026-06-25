export SOURCE_VERSION=2.15.0
export SOURCE_NAME=jansson-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://github.com/akheron/jansson/releases/download/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.bz2
	tar -xf ${SOURCE_NAME}.tar.bz2
}

prebuild() {
	sed -i 's/-Wl,--default-symver//g' ../configure
	../configure --prefix=/usr --disable-static 
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

