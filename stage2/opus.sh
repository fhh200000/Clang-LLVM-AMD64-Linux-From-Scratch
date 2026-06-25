export SOURCE_VERSION=1.6.1
export SOURCE_NAME=opus-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://downloads.xiph.org/releases/opus/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	meson setup --prefix=/usr        \
		--buildtype=release  \
		-D docdir=/usr/share/doc/${SOURCE_NAME}
}

build() {
	ninja
}

install() {
	ninja install
}

