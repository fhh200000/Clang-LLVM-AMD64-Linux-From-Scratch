export SOURCE_VERSION=3.13.1
export SOURCE_NAME=libaom-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://storage.googleapis.com/aom-releases/${SOURCE_NAME}.tar.gz
	wget https://www.linuxfromscratch.org/patches/blfs/13.0/libaom-3.13.1-nasm3-1.patch
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	pushd ..
	patch -Np1 -i ../libaom-3.13.1-nasm3-1.patch
	sed -i 's/aom aom_static/aom/' build/cmake/aom_install.cmake
	popd
	cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release  \
		-D BUILD_SHARED_LIBS=1       \
		-D ENABLE_DOCS=no            \
		-G Ninja ..
}

build() {
	ninja
}

install() {
	ninja install
}

