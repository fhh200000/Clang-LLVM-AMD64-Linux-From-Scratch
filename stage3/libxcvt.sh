export SOURCE_VERSION=0.1.3
export SOURCE_NAME=libxcvt-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://www.x.org/pub/individual/lib/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	meson setup ..             \
		--prefix=/usr        \
		--buildtype=release
}

build() {
	ninja
}

install() {
	ninja install
}

