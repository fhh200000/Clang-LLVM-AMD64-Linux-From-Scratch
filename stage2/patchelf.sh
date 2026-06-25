export SOURCE_VERSION=0.18.0
export SOURCE_NAME=patchelf-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/NixOS/patchelf/releases/download/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	../configure --prefix=/usr \
		--docdir=/usr/share/doc/patchelf-0.18.0
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

