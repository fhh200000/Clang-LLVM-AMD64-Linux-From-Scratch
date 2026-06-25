export SOURCE_VERSION=0.30
export SOURCE_NAME=libcanberra-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://0pointer.de/lennart/projects/libcanberra/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	pushd ..
	patch -Np1 -i ${SCRIPT_DIR}/libcanberra-remove-x11.patch
	sed -i 's/gdk-3.0 x11/gdk-3.0/g' configure
	popd
	../configure --prefix=/usr --disable-oss --enable-gtk3
}

build() {
	make -j$(nproc)
}

install() {
	make docdir=/usr/share/doc/${SOURCE_NAME} install
}

