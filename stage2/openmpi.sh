export SOURCE_VERSION=5.0.10
export SOURCE_NAME=openmpi-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://download.open-mpi.org/release/open-mpi/v5.0/${SOURCE_NAME}.tar.bz2
	tar -xf ${SOURCE_NAME}.tar.bz2
}

prebuild() {
	../configure --prefix=/usr                       \
		--disable-static
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

