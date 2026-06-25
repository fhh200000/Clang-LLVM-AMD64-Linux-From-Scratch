export SOURCE_VERSION=1.57.0
export SOURCE_NAME=pango-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://download.gnome.org/sources/pango/1.57/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	meson setup ..             \
		--prefix=/usr        \
		--buildtype=release \
		--wrap-mode=nofallback   \
		-D introspection=enabled 
}

build() {
	ninja
}

install() {
	ninja install
}

