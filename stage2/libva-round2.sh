export SOURCE_VERSION=2.23.0
export SOURCE_NAME=libva-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/intel/libva/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	meson setup --prefix=/usr --buildtype=release
}

build() {
	ninja
}

install() {
	ninja install
}

