export SOURCE_VERSION=vulkan-sdk-1.4.341.0
export SOURCE_NAME=Vulkan-Loader-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/KhronosGroup/Vulkan-Loader/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr   \
		-D CMAKE_BUILD_TYPE=Release    \
		-D CMAKE_SKIP_INSTALL_RPATH=ON \
		-D BUILD_WSI_XCB_SUPPORT=OFF \
		-D BUILD_WSI_XLIB_SUPPORT=OFF \
		-D BUILD_WSI_XLIB_XRANDR_SUPPORT=OFF \
		-D BUILD_WSI_WAYLAND_SUPPORT=ON \
		-G Ninja .. 
}
build() {
	ninja
}

install() {
	ninja install
}

