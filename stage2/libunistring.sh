export SOURCE_VERSION=1.4.1
export SOURCE_NAME=libunistring-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://ftpmirror.gnu.org/libunistring/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	pushd ..
	sed -r '/_GL_EXTERN_C/s/w?memchr|bsearch/(&)/' -i $(find -name \*.in.h)
	popd
	../configure --prefix=/usr    \
		--disable-static \
		--docdir=/usr/share/doc/libunistring-1.4.1
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

