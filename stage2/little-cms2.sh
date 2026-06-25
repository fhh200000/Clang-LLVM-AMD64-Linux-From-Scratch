export SOURCE_VERSION=2.18
export SOURCE_NAME=lcms2-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/mm2/Little-CMS/releases/download/lcms${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
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

