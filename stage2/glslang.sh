export SOURCE_VERSION=16.2.0
export SOURCE_NAME=glslang-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/KhronosGroup/glslang/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr     \
		-D CMAKE_BUILD_TYPE=Release      \
		-D ALLOW_EXTERNAL_SPIRV_TOOLS=ON \
		-D BUILD_SHARED_LIBS=ON          \
		-D GLSLANG_TESTS=ON              \
		-G Ninja .. 
}

build() {
	ninja
}

install() {
	ninja install
}

