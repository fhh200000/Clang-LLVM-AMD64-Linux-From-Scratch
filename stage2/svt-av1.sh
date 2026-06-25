export SOURCE_VERSION=v4.0.1
export SOURCE_NAME=SVT-AV1-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr   \
		-D CMAKE_BUILD_TYPE=Release    \
		-D CMAKE_SKIP_INSTALL_RPATH=ON \
		-D BUILD_SHARED_LIBS=ON        \
		-W no-dev -G Ninja ..
}

build() {
	ninja
}

install() {
	ninja install
}

