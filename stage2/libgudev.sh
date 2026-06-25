export SOURCE_VERSION=238
export SOURCE_NAME=libgudev-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://download.gnome.org/sources/libgudev/${SOURCE_VERSION}/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	sed -i "s/'-export-dynamic',/ /g" ../gudev/meson.build
	meson setup --prefix=/usr --buildtype=release ..
}

build() {
	ninja
}

install() {
	ninja install
}

