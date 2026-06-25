export SOURCE_VERSION=2.61.4
export SOURCE_NAME=librsvg-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget  https://download.gnome.org/sources/librsvg/2.61/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	sed -e "/OUTDIR/s|,| / 'librsvg-2.61.4', '--no-namespace-dir',|" \
		-e '/output/s|Rsvg-2.0|librsvg-2.61.4|'                      \
		-i ../doc/meson.build
	meson setup --prefix=/usr --buildtype=release ..
}

build() {
	ninja
}

install() {
	ninja install
}

