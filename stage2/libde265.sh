export SOURCE_VERSION=1.0.16
export SOURCE_NAME=libde265-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/strukturag/libde265/releases/download/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	pushd ..
	sed '/tools/d' -i Makefile.am &&
	./autogen.sh
	popd
	../configure --prefix=/usr         \
            --disable-sherlock265 \
            --disable-static
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

