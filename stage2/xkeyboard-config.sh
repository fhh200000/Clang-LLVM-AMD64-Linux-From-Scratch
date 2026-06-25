export SOURCE_VERSION=2.46
export SOURCE_NAME=xkeyboard-config-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://www.x.org/pub/individual/data/xkeyboard-config/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
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

