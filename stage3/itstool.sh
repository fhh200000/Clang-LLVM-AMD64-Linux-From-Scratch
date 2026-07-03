export SOURCE_VERSION=2.0.7
export SOURCE_NAME=itstool-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/itstool/itstool/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
	wget https://www.linuxfromscratch.org/patches/blfs/13.0/itstool-2.0.7-lxml-1.patch
}

prebuild() {
	pushd ..
	patch -Np1 -i ../itstool-2.0.7-lxml-1.patch
	popd
	PYTHON=/usr/bin/python3 ../autogen.sh --prefix=/usr
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

