export SOURCE_VERSION=2.0.8
export SOURCE_NAME=glycin-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://download.gnome.org/sources/glycin/2.0/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
	wget https://www.linuxfromscratch.org/patches/blfs/13.0/glycin-2.0.8-xbm_xpm-1.patch
}
prebuild() {
	pushd ..
	cargo vendor
	patch -Np1 -i ../glycin-2.0.8-xbm_xpm-1.patch && cargo vendor
	popd
	meson setup --prefix=/usr           \
            --buildtype=release     \
            -D libglycin-gtk4=false \
            -D tests=false ..
}

build() {
	ninja
}

install() {
	ninja install
}

