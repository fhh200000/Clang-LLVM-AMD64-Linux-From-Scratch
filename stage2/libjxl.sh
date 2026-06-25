export SOURCE_VERSION=0.11.2
export SOURCE_NAME=libjxl-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget  https://github.com/libjxl/libjxl/archive/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr             \
		-D CMAKE_BUILD_TYPE=Release            \
		-D BUILD_TESTING=OFF                     \
		-D BUILD_SHARED_LIBS=ON                  \
		-D JPEGXL_ENABLE_SKCMS=OFF               \
		-D JPEGXL_ENABLE_SJPEG=OFF               \
		-D JPEGXL_ENABLE_PLUGINS=OFF             \
		-D JPEGXL_INSTALL_JARDIR=/usr/share/java \
		-G Ninja ..
}

build() {
	ninja
}

install() {
	ninja install
}

