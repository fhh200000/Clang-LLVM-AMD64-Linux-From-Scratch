export SOURCE_VERSION=1.10.6
export SOURCE_NAME=libpcap-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://www.tcpdump.org/release/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	../configure --prefix=/usr
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

