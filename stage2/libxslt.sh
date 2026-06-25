export SOURCE_VERSION=1.1.45
export SOURCE_NAME=libxslt-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://download.gnome.org/sources/libxslt/1.1/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	../configure --prefix=/usr    \
		--disable-static \
		--without-python \
		--docdir=/usr/share/doc/libxslt-1.1.45
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

