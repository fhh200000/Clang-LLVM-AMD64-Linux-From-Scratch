export SOURCE_VERSION=0.11.0
export SOURCE_NAME=bubblewrap-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/containers/bubblewrap/releases/download/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.xz
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

