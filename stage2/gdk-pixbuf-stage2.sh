export SOURCE_VERSION=2.44.5
export SOURCE_NAME=gdk-pixbuf-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://download.gnome.org/sources/gdk-pixbuf/2.44/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	meson setup ..                \
		--prefix=/usr           \
		--buildtype=release     \
		-D png=disabled         \
		-D gif=disabled         \
		-D jpeg=disabled        \
		-D tiff=disabled        \
		-D thumbnailer=disabled \
		--wrap-mode=nofallback 
}

build() {
	ninja
}

install() {
	ninja install
}

