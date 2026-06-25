export SOURCE_VERSION=vulkan-sdk-1.4.341.0
export SOURCE_NAME=SPIRV-Tools-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/KhronosGroup/SPIRV-Tools/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr     \
		-D CMAKE_BUILD_TYPE=Release      \
		-D SPIRV_WERROR=OFF              \
		-D BUILD_SHARED_LIBS=ON          \
		-D SPIRV_TOOLS_BUILD_STATIC=OFF  \
		-D SPIRV-Headers_SOURCE_DIR=/usr \
		-G Ninja ..
}

build() {
	ninja
}

install() {
	ninja install
}

