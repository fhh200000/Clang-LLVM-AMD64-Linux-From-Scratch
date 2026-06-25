export SOURCE_VERSION=3.100
export SOURCE_NAME=lame-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://downloads.sourceforge.net/lame/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	sed -i -e 's/^\(\s*hardcode_libdir_flag_spec\s*=\).*/\1/' ../configure
	LDFLAGS="-Wl,--undefined-version ${LDFLAGS}" ../configure --prefix=/usr --enable-mp3rtp --disable-static
}

build() {
	make -j$(nproc)
}

install() {
	make pkghtmldir=/usr/share/doc/${SOURCE_NAME} install
}

