export SOURCE_VERSION=2.80.1
export SOURCE_NAME=glib-networking-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://download.gnome.org/sources/glib-networking/2.80/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}
prebuild() {
	meson setup             \
		--prefix=/usr        \
		--buildtype=release ..
}

build() {
	ninja
}

install() {
	ninja install
}

