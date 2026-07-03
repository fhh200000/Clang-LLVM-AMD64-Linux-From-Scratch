export SOURCE_VERSION=6.7.1
export SOURCE_NAME=plasma-activities-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://download.kde.org/stable/plasma/${SOURCE_VERSION}/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release         \
		-D BUILD_TESTING=OFF                \
		-W no-dev ..
}
build() {
	make -j$(nproc)
}

install() {
	make install
}
