export SOURCE_VERSION=2.23
export SOURCE_NAME=which-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://ftpmirror.gnu.org/which/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
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

