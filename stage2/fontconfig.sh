export SOURCE_VERSION=2.17.1
export SOURCE_NAME=fontconfig-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/${SOURCE_VERSION}/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	../configure --prefix=/usr        \
		--sysconfdir=/etc    \
		--localstatedir=/var \
		--disable-docs       \
		--docdir=/usr/share/doc/${SOURCE_NAME}
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

