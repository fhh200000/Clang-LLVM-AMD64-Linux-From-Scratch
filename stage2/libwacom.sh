export SOURCE_VERSION=2.18.0
export SOURCE_NAME=libwacom-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/linuxwacom/libwacom/releases/download/${SOURCE_NAME}/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	meson setup ..                  \
		--prefix=/usr     \
		--buildtype=release       \
		-D tests=disabled 
}

build() {
	ninja
}

install() {
	ninja install
}

