export SOURCE_VERSION=3.8.0
export SOURCE_NAME=freeglut-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://downloads.sourceforge.net/freeglut/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	sed -i 's/APPEND LIBS OpenGL::GL/APPEND LIBS OpenGL::OpenGL/g' ../CMakeLists.txt
	cmake -D CMAKE_INSTALL_PREFIX=/usr        \
		-D CMAKE_BUILD_TYPE=Release         \
		-D FREEGLUT_BUILD_DEMOS=OFF         \
		-D FREEGLUT_BUILD_STATIC_LIBS=OFF   \
		-D FREEGLUT_WAYLAND=ON              \
		-W no-dev ..
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

