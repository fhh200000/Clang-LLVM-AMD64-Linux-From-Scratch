export SOURCE_VERSION=1.9
export SOURCE_NAME=libndp-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget http://libndp.org/files/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	../configure --prefix=/usr        \
		--sysconfdir=/etc    \
		--localstatedir=/var \
		--disable-static
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

