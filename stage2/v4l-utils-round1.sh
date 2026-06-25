export SOURCE_VERSION=1.32.0
export SOURCE_NAME=v4l-utils-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://www.linuxtv.org/downloads/v4l-utils/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	meson setup ..            \
		--prefix=/usr       \
		--buildtype=release \
		-D gconv=disabled   \
		-D doxygen-doc=disabled
}

build() {
	ninja -j$(nproc)
}

install() {
	ninja install
	for prog in v4l2gl v4l2grab
	do
		cp -v contrib/test/$prog /usr/bin
	done
}

