export SOURCE_VERSION=0.46.4
export SOURCE_NAME=pixman-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://www.cairographics.org/releases/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
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

