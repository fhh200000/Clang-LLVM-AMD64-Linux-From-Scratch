export SOURCE_VERSION=1.24.2
export SOURCE_NAME=ModemManager-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	meson setup ..                 \
		--prefix=/usr            \
		--buildtype=release      \
		-D bash_completion=false \
		-D qrtr=false
}

build() {
	ninja
}

install() {
	ninja install
}

