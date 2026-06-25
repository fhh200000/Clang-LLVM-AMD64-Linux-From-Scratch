export SOURCE_VERSION=2.86.4
export SOURCE_NAME=glib-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://download.gnome.org/sources/glib/2.86/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
	wget https://download.gnome.org/sources/gobject-introspection/1.86/gobject-introspection-1.86.0.tar.xz
	wget https://www.linuxfromscratch.org/patches/blfs/13.0/glib-skip_warnings-1.patch
	wget https://www.linuxfromscratch.org/patches/blfs/13.0/glib-2.86.4-upstream_fixes-1.patch
}

prebuild() {
	pushd ..
	patch -Np1 -i ../glib-skip_warnings-1.patch
	patch -Np1 -i ../glib-2.86.4-upstream_fixes-1.patch
	popd
	meson setup ..                  \
		--prefix=/usr             \
		--buildtype=release       \
		-D introspection=disabled \
		-D glib_debug=disabled    \
		-D man-pages=enabled      \
		-D sysprof=disabled
}

build() {
	ninja
}

install() {
	ninja install
	tar xf ../../gobject-introspection-1.86.0.tar.xz &&
	meson setup gobject-introspection-1.86.0 gi-build \
		--prefix=/usr --buildtype=release     &&
	ninja -C gi-build
	ninja -C gi-build install
	meson configure -D introspection=enabled &&
	ninja
	ninja install
}

