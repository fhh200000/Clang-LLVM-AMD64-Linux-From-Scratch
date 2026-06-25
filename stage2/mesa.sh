export SOURCE_VERSION=25.3.5
export SOURCE_NAME=mesa-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://mesa.freedesktop.org/archive/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	sed -i 's/strstr/(char *)strstr/g' ../src/amd/vulkan/radv_debug.c
	sed -i 's/strchr/(char *)strchr/g' ../src/amd/vulkan/radv_debug.c
	sed -i 's/elt = bsearch/elt = (enum_elt *)bsearch/g' ../src/mesa/glapi/glapi/gen/gl_enums.py
	sed -i 's/char \*U3AS1/const char *U3AS1/g' ../src/compiler/clc/nir_load_libclc.c
	meson setup ..                 \
		--prefix=/usr    \
		--buildtype=release      \
		-D platforms=wayland \
		-D gallium-drivers=auto  \
		-D vulkan-drivers=auto   \
		-D valgrind=disabled     \
		-D video-codecs=all      \
		-D libunwind=disabled    \
		-D glx=disabled
}

build() {
	ninja
}

install() {
	ninja install
}

