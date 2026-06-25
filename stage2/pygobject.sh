export SOURCE_VERSION=3.54.5
export SOURCE_NAME=pygobject-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://download.gnome.org/sources/pygobject/3.54/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	mv -v ../tests/test_gdbus.py{,.nouse}         &&
	mv -v ../tests/test_overrides_gtk.py{,.nouse}
	meson setup --prefix=/usr --buildtype=release ..
}
build() {
	ninja
}

install() {
	ninja install
}

