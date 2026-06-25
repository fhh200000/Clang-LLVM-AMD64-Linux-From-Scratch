export SOURCE_VERSION=0.21.5
export SOURCE_NAME=libpsl-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/rockdaboot/libpsl/releases/download/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
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

