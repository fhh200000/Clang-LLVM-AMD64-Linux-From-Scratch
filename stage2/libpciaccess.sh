export SOURCE_VERSION=0.19
export SOURCE_NAME=libpciaccess-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://xorg.freedesktop.org/archive/individual/lib/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	meson setup --prefix=/usr \
		--buildtype=release
}

build() {
	ninja
}

install() {
	ninja install
}

