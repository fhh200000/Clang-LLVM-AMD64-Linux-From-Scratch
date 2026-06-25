export SOURCE_VERSION=2.32.64
export SOURCE_NAME=sdl2-compat-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://www.libsdl.org/release/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr   \
		-D CMAKE_BUILD_TYPE=Release    \
		-D CMAKE_SKIP_INSTALL_RPATH=ON \
		-D SDL2COMPAT_STATIC=OFF       \
		-D SDL2COMPAT_TESTS=OFF        \
		-D SDL2COMPAT_X11=OFF          \
		-W no-dev -G Ninja .. 
}

build() {
	ninja
}

install() {
	ninja install
	rm -vf /usr/lib/libSDL2_test.a
}

