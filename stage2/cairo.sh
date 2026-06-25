export SOURCE_VERSION=1.18.4
export SOURCE_NAME=cairo-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://www.cairographics.org/releases/${SOURCE_NAME}.tar.xz
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

