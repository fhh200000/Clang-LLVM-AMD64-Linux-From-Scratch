export SOURCE_VERSION=49.1
export SOURCE_NAME=gsettings-desktop-schemas-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://download.gnome.org/sources/gsettings-desktop-schemas/49/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}
prebuild() {
	sed -i -r 's:"(/system):"/org/gnome\1:g' ../schemas/*.in
	meson setup --prefix=/usr --buildtype=release ..
}

build() {
	ninja
}

install() {
	ninja install
}

