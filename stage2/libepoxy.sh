export SOURCE_VERSION=1.5.10
export SOURCE_NAME=libepoxy-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://download.gnome.org/sources/libepoxy/1.5/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	meson setup --prefix=/usr --buildtype=release -D x11=false ..
}

build() {
	ninja
}

install() {
	ninja install
}

