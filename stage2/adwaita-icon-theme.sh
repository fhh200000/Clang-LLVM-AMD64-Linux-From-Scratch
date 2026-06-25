export SOURCE_VERSION=49.0
export SOURCE_NAME=adwaita-icon-theme-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://download.gnome.org/sources/adwaita-icon-theme/49/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	meson setup ..            \
		--prefix=/usr 
}

build() {
	ninja
}

install() {
	ninja install
}

