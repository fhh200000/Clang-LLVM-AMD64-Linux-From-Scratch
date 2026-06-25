export SOURCE_VERSION=1.2.15.3
export SOURCE_NAME=alsa-lib-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://www.alsa-project.org/files/pub/lib/${SOURCE_NAME}.tar.bz2
	tar -xf ${SOURCE_NAME}.tar.bz2
	wget https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-${SOURCE_VERSION}.tar.bz2
}

prebuild() {
	../configure
}

build() {
	make -j$(nproc)
}

install() {
	make install &&
		tar -C /usr/share/alsa --strip-components=1 -xf ../../alsa-ucm-conf-1.2.15.3.tar.bz2
}

