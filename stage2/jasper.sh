export SOURCE_VERSION=version-4.2.8
export SOURCE_NAME=jasper-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/jasper-software/jasper/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr    \
		-D CMAKE_BUILD_TYPE=Release     \
		-D CMAKE_SKIP_INSTALL_RPATH=ON  \
		-D JAS_ENABLE_DOC=NO            \
		-D ALLOW_IN_SOURCE_BUILD=YES    \
		-D CMAKE_INSTALL_DOCDIR=/usr/share/doc/jasper-4.2.8 \
		..
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

