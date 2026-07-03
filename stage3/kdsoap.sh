export SOURCE_VERSION=2.2.0
export SOURCE_NAME=kdsoap-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget  https://github.com/KDAB/KDSoap/releases/download/${SOURCE_NAME}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release         \
		-D KDSoap_QT6=ON   \
		-W no-dev ..
}
build() {
	make -j$(nproc)
}

install() {
	make install
}
