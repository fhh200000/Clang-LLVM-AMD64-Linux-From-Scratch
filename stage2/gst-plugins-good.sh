export SOURCE_VERSION=1.28.1
export SOURCE_NAME=gst-plugins-good-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://gstreamer.freedesktop.org/src/gst-plugins-good/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	meson setup ..            \
		--prefix=/usr       \
		--buildtype=release 
}

build() {
	ninja
}

install() {
	ninja install
}

