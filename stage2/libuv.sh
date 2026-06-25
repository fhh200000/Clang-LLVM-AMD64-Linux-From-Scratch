export SOURCE_VERSION=v1.52.0
export SOURCE_NAME=libuv-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://dist.libuv.org/dist/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	pushd ..
	sh autogen.sh
	popd
	../configure --prefix=/usr --disable-static
}

build() {
	make -j$(proc)
}

install() {
	make install
}

