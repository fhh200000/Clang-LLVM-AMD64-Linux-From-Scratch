export SOURCE_VERSION=1.3.1
export SOURCE_NAME=libnftnl-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://netfilter.org/projects/libnftnl/files/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
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

