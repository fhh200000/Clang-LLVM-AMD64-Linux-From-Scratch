export SOURCE_VERSION=2.5.4
export SOURCE_NAME=openjpeg-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/uclouvain/openjpeg/archive/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	cmake -D CMAKE_BUILD_TYPE=Release  \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D BUILD_STATIC_LIBS=OFF ..
}

build() {
	make -j$(nproc)
}

install() {
	make install
	cp -rv ../doc/man -T /usr/share/man
}

