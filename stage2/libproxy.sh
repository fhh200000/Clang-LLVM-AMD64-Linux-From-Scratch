export SOURCE_VERSION=0.5.12
export SOURCE_NAME=libproxy-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/libproxy/libproxy/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	meson setup ..        \
		--prefix=/usr   \
		-D release=true \
		-D docs=false
}

build() {
	ninja -j$(nproc)
}

install() {
	ninja install
	rm /usr/lib/libproxy.a
}

