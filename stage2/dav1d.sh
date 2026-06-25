export SOURCE_VERSION=1.5.3
export SOURCE_NAME=dav1d-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://code.videolan.org/videolan/dav1d/-/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
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

