export SOURCE_VERSION=1.0.5
export SOURCE_NAME=libmnl-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://netfilter.org/projects/libmnl/files/${SOURCE_NAME}.tar.bz2
	tar -xf ${SOURCE_NAME}.tar.bz2
}

prebuild() {
	../configure --prefix=/usr     \
		--sysconfdir=/etc \
		--disable-static 
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

