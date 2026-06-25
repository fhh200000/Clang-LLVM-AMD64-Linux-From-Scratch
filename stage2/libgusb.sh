export SOURCE_VERSION=0.4.9
export SOURCE_NAME=libgusb-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/hughsie/libgusb/releases/download/${SOURCE_VERSION}/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	meson setup --prefix=/usr --buildtype=release -D docs=false   ..
}

build() {
	ninja
}

install() {
	ninja install
}

