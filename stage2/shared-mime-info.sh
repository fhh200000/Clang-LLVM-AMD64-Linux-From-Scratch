export SOURCE_VERSION=2.4
export SOURCE_NAME=shared-mime-info-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://gitlab.freedesktop.org/xdg/shared-mime-info/-/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	meson setup --prefix=/usr --buildtype=release -D update-mimedb=true ..
}

build() {
	ninja
}

install() {
	ninja install
}

