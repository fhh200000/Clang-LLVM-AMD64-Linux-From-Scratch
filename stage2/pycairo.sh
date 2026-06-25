export SOURCE_VERSION=1.29.0
export SOURCE_NAME=pycairo-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/pygobject/pycairo/releases/download/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	meson setup --prefix=/usr --buildtype=release ..
}
build() {
	ninja
}

install() {
	ninja install
}

