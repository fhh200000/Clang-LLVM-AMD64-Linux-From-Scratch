export SOURCE_VERSION=3.1.3
export SOURCE_NAME=libjpeg-turbo-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/libjpeg-turbo/libjpeg-turbo/releases/download/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr        \
		-D CMAKE_BUILD_TYPE=RELEASE         \
		-D ENABLE_STATIC=FALSE              \
		-D CMAKE_INSTALL_DEFAULT_LIBDIR=lib \
		-D CMAKE_SKIP_INSTALL_RPATH=ON      \
		-D CMAKE_INSTALL_DOCDIR=/usr/share/doc/${SOURCE_NAME} \
		..
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

