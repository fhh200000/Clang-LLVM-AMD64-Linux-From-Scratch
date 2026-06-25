export SOURCE_VERSION=22.1.3
export SOURCE_NAME=SPIRV-LLVM-Translator-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/KhronosGroup/SPIRV-LLVM-Translator/archive/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr     \
		-D CMAKE_BUILD_TYPE=Release      \
		-D BUILD_SHARED_LIBS=ON          \
		-D CMAKE_SKIP_INSTALL_RPATH=ON   \
		-D SPIRV-Headers_SOURCE_DIR=/usr \
		-G Ninja ..
}

build() {
	ninja
}

install() {
	ninja install
}

