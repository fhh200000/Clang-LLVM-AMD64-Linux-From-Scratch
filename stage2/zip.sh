export SOURCE_VERSION=30
export SOURCE_NAME=zip${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://downloads.sourceforge.net/infozip/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	return 0
}

build() {
	pushd ..
	make -f unix/Makefile generic CC="gcc -std=gnu89"
	popd
}

install() {
	pushd ..
	make prefix=/usr MANDIR=/usr/share/man/man1 -f unix/Makefile install
	popd
}

