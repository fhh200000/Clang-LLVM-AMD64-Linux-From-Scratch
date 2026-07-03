export SOURCE_VERSION=0.4.0
export SOURCE_NAME=kdsoap-ws-discovery-client-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://download.kde.org/stable/kdsoap-ws-discovery-client//${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release         \
		-D CMAKE_SKIP_INSTALL_RPATH=ON  \
		-D QT_MAJOR_VERSION=6 -W no-dev ..
}
build() {
	make -j$(nproc)
}

install() {
	make install
}
