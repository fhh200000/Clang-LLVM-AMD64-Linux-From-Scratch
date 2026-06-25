export SOURCE_VERSION=1.0.16
export SOURCE_NAME=fribidi-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/fribidi/fribidi/releases/download/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.xz
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

