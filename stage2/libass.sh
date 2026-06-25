export SOURCE_VERSION=0.17.4
export SOURCE_NAME=libass-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://github.com/libass/libass/releases/download/${SOURCE_VERSION}/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	../configure --prefix=/usr --disable-static
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

