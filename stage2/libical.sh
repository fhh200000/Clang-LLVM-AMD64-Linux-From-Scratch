export SOURCE_VERSION=3.0.20
export SOURCE_NAME=libical-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/libical/libical/releases/download/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr  \
		-D CMAKE_BUILD_TYPE=Release   \
		-D SHARED_ONLY=yes            \
		-D ICAL_BUILD_DOCS=false      \
		-D GOBJECT_INTROSPECTION=true \
		-D ICAL_GLIB_VAPI=true        \
		..
}

build() {
	make
}

install() {
	make install
}

