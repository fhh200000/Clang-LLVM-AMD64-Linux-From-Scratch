export SOURCE_VERSION=2.0.3
export SOURCE_NAME=fdk-aac-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://downloads.sourceforge.net/opencore-amr/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	../configure --prefix=/usr    \
		--disable-static
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

