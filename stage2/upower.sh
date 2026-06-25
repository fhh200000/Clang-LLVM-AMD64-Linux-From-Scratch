export SOURCE_VERSION=1.91.1
export SOURCE_NAME=upower-v${SOURCE_VERSION}-57f59b584e066dddafaa11cb8137b32e6e3d15c7
export SCRIPT_DIR=$(pwd)

download() {
        wget https://gitlab.freedesktop.org/upower/upower/-/archive/v${SOURCE_VERSION}/upower-${SOURCE_VERSION}.tar.bz2
	tar -xf upower-${SOURCE_VERSION}.tar.bz2
}

prebuild() {
	meson setup ..            \
		--prefix=/usr       \
		--buildtype=release \
		-D gtk-doc=false    \
		-D man=false 
}

build() {
	ninja
}

install() {
	ninja install
}

