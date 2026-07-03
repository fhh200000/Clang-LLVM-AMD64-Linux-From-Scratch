export SOURCE_VERSION=26.04.2
export SOURCE_NAME=dolphin-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://download.kde.org/stable/release-service/${SOURCE_VERSION}/src/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	sed -i 's/set(HAVE_X11 TRUE)/set(HAVE_X11 FALSE)/g' ../CMakeLists.txt
	cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release         \
		-D BUILD_TESTING=OFF                \
		-D HAVE_X11=FALSE                   \
		-W no-dev ..
}
build() {
	make -j$(nproc)
}

install() {
	make install
}
