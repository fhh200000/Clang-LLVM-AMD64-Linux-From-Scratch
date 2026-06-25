export SOURCE_VERSION=1.34.0
export SOURCE_NAME=libmbim-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	meson setup ..                 \
		--prefix=/usr            \
		--buildtype=release      \
		-D bash_completion=false \
		-D man=false 
}

build() {
	ninja
}

install() {
	ninja install
}

