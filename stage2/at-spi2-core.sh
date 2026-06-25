export SOURCE_VERSION=2.58.3
export SOURCE_NAME=at-spi2-core-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://download.gnome.org/sources/at-spi2-core/2.58/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	meson setup --prefix=/usr --buildtype=release -D gtk2_atk_adaptor=false ..
}

build() {
	ninja
}

install() {
	ninja install
}

