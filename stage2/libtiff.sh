export SOURCE_VERSION=4.7.1
export SOURCE_NAME=tiff-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://download.osgeo.org/libtiff/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr        \
		-D CMAKE_BUILD_TYPE=RELEASE         \
		..
}

build() {
	make -j$(nproc)
}

install() {
	make install && \
		mv -v /usr/share/doc/{tiff,libtiff-4.7.1}
}

