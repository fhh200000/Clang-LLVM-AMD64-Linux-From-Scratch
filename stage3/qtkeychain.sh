export SOURCE_VERSION=0.15.0
export SOURCE_NAME=qtkeychain-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget  https://github.com/frankosterfeld/qtkeychain/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release         \
		-D BUILD_WITH_QT6=ON            \
		-D BUILD_TESTING=OFF \
		-W no-dev ..
}
build() {
	make -j$(nproc)
}

install() {
	make install
}
