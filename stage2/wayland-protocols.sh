export SOURCE_VERSION=1.47
export SOURCE_NAME=wayland-protocols-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${SOURCE_VERSION}/downloads/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	 meson setup ..            \
		--prefix=/usr       \
		--buildtype=release
}

build() {
	ninja
}

install() {
	ninja install
}

