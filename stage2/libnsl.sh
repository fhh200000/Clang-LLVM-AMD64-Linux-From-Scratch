export SOURCE_VERSION=2.0.1
export SOURCE_NAME=libnsl-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/thkukuk/libnsl/releases/download/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	../configure --disable-static --sysconfdir=/etc
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

