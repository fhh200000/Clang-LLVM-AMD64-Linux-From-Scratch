export SOURCE_VERSION=0.56.18
export SOURCE_NAME=vala-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://download.gnome.org/sources/vala/0.56/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
	wget https://www.linuxfromscratch.org/patches/blfs/13.0/vala-0.56.18-graphviz_13_fix-1.patch
}

prebuild() {
	pushd ..
	patch -Np1 -i ../vala-0.56.18-graphviz_13_fix-1.patch
	./configure --prefix=/usr
	ret=$?
	popd
	return $ret
}

build() {
	pushd ..
	make -j$(nproc) bootstrap
	ret=$?
	popd
	return $ret
}

install() {
	pushd ..
	make install
	ret=$?
	popd
	return $ret
}

