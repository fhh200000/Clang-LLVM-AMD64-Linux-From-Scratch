export SOURCE_VERSION=33.5
export SOURCE_NAME=protobuf-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/protocolbuffers/protobuf/releases/download/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr      \
		-D CMAKE_BUILD_TYPE=Release       \
		-D CMAKE_SKIP_INSTALL_RPATH=ON    \
		-D protobuf_BUILD_TESTS=OFF       \
		-D protobuf_BUILD_SHARED_LIBS=ON  \
		-G Ninja ..
}

build() {
	ninja
}

install() {
	ninja install
}

