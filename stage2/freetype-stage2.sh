export SOURCE_VERSION=2.14.1
export SOURCE_NAME=freetype-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://downloads.sourceforge.net/freetype/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	pushd ..
	sed -ri "s:.*(AUX_MODULES.*valid):\1:" modules.cfg &&
	sed -r "s:.*(#.*SUBPIXEL_RENDERING) .*:\1:" \
		-i include/freetype/config/ftoption.h
	popd
	../configure --prefix=/usr            \
            --disable-static         \
            --enable-freetype-config \
	    --with-harfbuzz=yes
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

