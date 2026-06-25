export SOURCE_VERSION=3.6.6
export SOURCE_NAME=libsoup-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://download.gnome.org/sources/libsoup/3.6/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
	wget https://www.linuxfromscratch.org/patches/blfs/13.0/libsoup-3.6.6-upstream_fixes-1.patch
}

prebuild() {
	pushd ..
	patch -Np1 -i ../libsoup-3.6.6-upstream_fixes-1.patch
	sed 's/apiversion/soup_version/' -i docs/reference/meson.build
	popd
	meson setup --prefix=/usr --buildtype=release --wrap-mode=nofallback ..
}

build() {
	ninja
}

install() {
	ninja install
}

