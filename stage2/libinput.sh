export SOURCE_VERSION=1.31.0
export SOURCE_NAME=libinput-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://gitlab.freedesktop.org/libinput/libinput/-/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	meson setup ..                  \
		--prefix=/usr     \
		--buildtype=release       \
		-D udev-dir=/usr/lib/udev \
		-D documentation=false \
		-D tests=false
}

build() {
	ninja
}

install() {
	ninja install
}

