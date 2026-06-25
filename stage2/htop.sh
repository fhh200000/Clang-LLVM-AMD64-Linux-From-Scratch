export SOURCE_VERSION=3.5.1
export SOURCE_NAME=htop-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/htop-dev/htop/releases/download/${SOURCE_VERSION}/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	../configure --prefix=/usr        \
	--disable-static
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

