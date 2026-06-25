export SOURCE_VERSION=4.4.1
export SOURCE_NAME=swig-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://downloads.sourceforge.net/swig/${SOURCE_NAME}.tar.gz
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

