export SOURCE_VERSION=0.3.0
export SOURCE_NAME=libdisplay-info-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://gitlab.freedesktop.org/emersion/libdisplay-info/-/releases/${SOURCE_VERSION}/downloads/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	meson setup --prefix=/usr --buildtype=release ..
}

build() {
	ninja
}

install() {
	ninja install
}

