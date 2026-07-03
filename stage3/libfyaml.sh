export SOURCE_VERSION=0.9.4
export SOURCE_NAME=libfyaml-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/pantoniou/libfyaml/releases/download/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	../configure --prefix=/usr --disable-static
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

