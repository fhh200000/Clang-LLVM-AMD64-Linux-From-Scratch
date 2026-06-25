export SOURCE_VERSION=1.6.0
export SOURCE_NAME=pipewire-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.bz2
	tar -xf ${SOURCE_NAME}.tar.bz2
}

prebuild() {
	sed -i 's/= strchr/= (char *)strchr/g' ../spa/plugins/bluez5/bluez5-dbus.c
	sed -i 's/= strstr/= (char *)strstr/g' ../pipewire-jack/src/pipewire-jack.c
	sed -i 's/= strrchr/= (char *)strrchr/g' ../spa/plugins/alsa/acp/compat.h
	sed -i 's/= strrchr/= (char *)strrchr/g' ../spa/plugins/support/logger.c
	meson setup ..             \
		--prefix=/usr        \
		--buildtype=release \
		-D session-managers="[]"
}

build() {
	ninja
}

install() {
	ninja install
}

