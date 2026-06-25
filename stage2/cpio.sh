export SOURCE_VERSION=2.15
export SOURCE_NAME=cpio-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://ftpmirror.gnu.org/cpio/${SOURCE_NAME}.tar.bz2
	tar -xf ${SOURCE_NAME}.tar.bz2
}

prebuild() {
	sed -e "/^extern int (\*xstat)/s/()/(const char * restrict,  struct stat * restrict)/" \
		-i src/extern.h
	sed -e "/^int (\*xstat)/s/()/(const char * restrict,  struct stat * restrict)/" \
		-i src/global.c
	../configure --prefix=/usr --enable-mt  --with-rmt=/usr/libexec/rmt
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

