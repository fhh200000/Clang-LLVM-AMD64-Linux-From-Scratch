export SOURCE_VERSION=12.3.2
export SOURCE_NAME=harfbuzz-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget  https://github.com/harfbuzz/harfbuzz/releases/download/${SOURCE_VERSION}/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	meson setup ..             \
		--prefix=/usr        \
		--buildtype=release  \
		-D graphite2=enabled
}

build() {
	ninja
}

install() {
	ninja install
}

