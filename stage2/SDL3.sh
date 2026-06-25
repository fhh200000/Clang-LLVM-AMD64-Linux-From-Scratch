export SOURCE_VERSION=3.4.10
export SOURCE_NAME=SDL3-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://www.libsdl.org/release/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release  \
		-D SDL_TEST_LIBRARY=OFF      \
		-D SDL_STATIC=OFF            \
		-D SDL_RPATH=OFF             \
		-W no-dev -G Ninja --trace .. 2> 1.log
}

build() {
	ninja
}

install() {
	ninja install
}

