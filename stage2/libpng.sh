export SOURCE_VERSION=1.6.55
export SOURCE_NAME=libpng-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://downloads.sourceforge.net/libpng/${SOURCE_NAME}.tar.xz
	wget https://downloads.sourceforge.net/sourceforge/libpng-apng/libpng-1.6.54-apng.patch.gz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	pushd ..
	zcat ../libpng-1.6.54-apng.patch.gz | patch -p1
	popd
	../configure --prefix=/usr --disable-static
}

build() {
	make -j$(nproc)
}

install() {
	make install
	mkdir -v /usr/share/doc/libpng-1.6.55
	cp -v ../README ../libpng-manual.txt /usr/share/doc/libpng-1.6.55
}

