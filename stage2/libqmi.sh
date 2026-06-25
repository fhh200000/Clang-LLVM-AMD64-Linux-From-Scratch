export SOURCE_VERSION=1.38.0
export SOURCE_NAME=libqmi-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	meson setup ..                 \
		--prefix=/usr            \
		--buildtype=release      \
		-D bash_completion=false \
		-D qrtr=false            \
		-D man=false 
}

build() {
	ninja
}

install() {
	ninja install
}

