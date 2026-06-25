export SOURCE_VERSION=1.28.1
export SOURCE_NAME=gstreamer-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://gstreamer.freedesktop.org/src/gstreamer/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	meson setup ..            \
		--prefix=/usr       \
		--buildtype=release \
		-D gst_debug=false
}

build() {
	ninja
}

install() {
	ninja install
}

