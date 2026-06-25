export SOURCE_VERSION=20251101
export SOURCE_NAME=mobile-broadband-provider-info-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://gitlab.gnome.org/GNOME/mobile-broadband-provider-info/-/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	meson setup ..                    \
		--prefix=/usr               \
		--buildtype=release
}

build() {
	ninja
}

install() {
	ninja install
}
