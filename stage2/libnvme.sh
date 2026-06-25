export SOURCE_VERSION=1.16.1
export SOURCE_NAME=libnvme-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/linux-nvme/libnvme/archive/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	meson setup --prefix=/usr --buildtype=release -D libdbus=auto ..
}

build() {
	ninja
}

install() {
	ninja install
}

