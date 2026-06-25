export SOURCE_VERSION=1.10.8
export SOURCE_NAME=json-glib-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://download.gnome.org/sources/json-glib/1.10/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	meson setup --prefix=/usr --buildtype=release  ..
}

build() {
	ninja
}

install() {
	ninja install
}

