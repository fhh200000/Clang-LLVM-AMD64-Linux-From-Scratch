export SOURCE_VERSION=1.24.0
export SOURCE_NAME=wayland-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://gitlab.freedesktop.org/wayland/wayland/-/releases/${SOURCE_VERSION}/downloads/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	CFLAGS="-march=native -mtune=native -flto" LDFLAGS="" meson setup ..            \
		--prefix=/usr       \
		--buildtype=release \
		-D documentation=false
}

build() {
	ninja
}

install() {
	ninja install
}

