export SOURCE_VERSION=1.13.6
export SOURCE_NAME=libevdev-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://www.freedesktop.org/software/libevdev/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	meson setup ..                  \
		--prefix=/usr     \
		--buildtype=release       \
		-D documentation=disabled \
		-D tests=disabled 
}

build() {
	ninja
}

install() {
	ninja install
}

