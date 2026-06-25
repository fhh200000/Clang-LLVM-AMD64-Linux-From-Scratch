export SOURCE_VERSION=1.13.1
export SOURCE_NAME=libxkbcommon-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/lfs-book/libxkbcommon/archive/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	meson setup ..             \
		--prefix=/usr        \
		--buildtype=release  \
		-Denable-x11=false   \
		-D enable-docs=false
}

build() {
	ninja
}

install() {
	ninja install
}

