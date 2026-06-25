export SOURCE_VERSION=1.8.12
export SOURCE_NAME=iptables-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://www.netfilter.org/projects/iptables/files/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	../configure --prefix=/usr      \
		--enable-nftables \
		--enable-libipq
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

