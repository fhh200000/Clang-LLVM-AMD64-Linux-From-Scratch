export SOURCE_VERSION=1.8.1
export SOURCE_NAME=pulseaudio-qt-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://download.kde.org/stable/pulseaudio-qt/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release         \
		-D CMAKE_SKIP_INSTALL_RPATH=ON      \
		-D BUILD_TESTING=OFF                \
		-W no-dev ..
}
build() {
	make -j$(nproc)
}

install() {
	make install
}
