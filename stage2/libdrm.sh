export SOURCE_VERSION=2.4.131
export SOURCE_NAME=libdrm-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://dri.freedesktop.org/libdrm/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	meson setup --prefix=/usr \
		--buildtype=release   \
		-D udev=true          \
		-D valgrind=disabled
}

build() {
	ninja
}

install() {
	ninja install
}

