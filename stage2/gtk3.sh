export SOURCE_VERSION=3.24.51
export SOURCE_NAME=gtk-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://download.gnome.org/sources/gtk/3.24/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	meson setup ..            \
		--prefix=/usr       \
		--buildtype=release \
		-D man=false        \
		-D broadway_backend=true \
		-D x11_backend=false \
		-D cloudproviders=true
}

build() {
	ninja
}

install() {
	ninja install
}

