export SOURCE_VERSION=vulkan-sdk-1.4.341.0
export SOURCE_NAME=SPIRV-Headers-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/KhronosGroup/SPIRV-Headers/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr -G Ninja ..
}

build() {
	ninja
}

install() {
	ninja install
}

