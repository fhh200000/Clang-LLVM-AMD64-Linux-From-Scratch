export SOURCE_VERSION=1.1.6
export SOURCE_NAME=nftables-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://netfilter.org/projects/nftables/files/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	../configure --prefix=/usr     \
		--sysconfdir=/etc \
		--disable-static \
		--with-json \
		--with-unitdir \
		--with-xtables 
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

