export SOURCE_VERSION=12.3.2
export SOURCE_NAME=qpdf-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/qpdf/qpdf/releases/download/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release  \
		-D BUILD_STATIC_LIBS=OFF     \
		-D CMAKE_INSTALL_DOCDIR=/usr/share/doc/${SOURCE_NAME} .. \
		-G Ninja
}

build() {
	ninja -j$(nproc)
}

install() {
	ninja install
}

