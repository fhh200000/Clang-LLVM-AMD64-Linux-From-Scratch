export SOURCE_VERSION=1.19
export SOURCE_NAME=popt-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://ftp.osuosl.org/pub/rpm/popt/releases/popt-1.x/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	LDFLAGS="-Wl,--undefined-version" ../configure --prefix=/usr --disable-static
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

