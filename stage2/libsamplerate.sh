export SOURCE_VERSION=0.2.2
export SOURCE_NAME=libsamplerate-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/libsndfile/libsamplerate/releases/download/${SOURCE_VERSION}/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	../configure --prefix=/usr    \
		--disable-static \
		--docdir=/usr/share/doc/${SOURCE_NAME}
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

