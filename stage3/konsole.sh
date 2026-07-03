export SOURCE_VERSION=26.04.2
export SOURCE_NAME=konsole-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://download.kde.org/stable/release-service/${SOURCE_VERSION}/src/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
	wget https://www.linuxfromscratch.org/patches/blfs/13.0/konsole-adjust_scrollbar-1.patch
}

prebuild() {
	pushd ..
	patch -Np1 -i ../konsole-adjust_scrollbar-1.patch
	popd
	cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release         \
		-D BUILD_TESTING=OFF                \
		-D WITH_X11=OFF    \
		-W no-dev ..
}
build() {
	make -j$(nproc)
}

install() {
	make install
}
