export SOURCE_VERSION=20260107.1
export SOURCE_NAME=abseil-cpp-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget  https://github.com/abseil/abseil-cpp/releases/download/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr   \
		-D CMAKE_BUILD_TYPE=Release    \
		-D CMAKE_SKIP_INSTALL_RPATH=ON \
		-D ABSL_PROPAGATE_CXX_STD=ON   \
		-D BUILD_SHARED_LIBS=ON        \
		-G Ninja ..
}

build() {
	ninja
}

install() {
	ninja install
}

