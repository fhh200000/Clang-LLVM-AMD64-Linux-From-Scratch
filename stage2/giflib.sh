export SOURCE_VERSION=5.2.2
export SOURCE_NAME=giflib-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://sourceforge.net/projects/giflib/files/${SOURCE_NAME}.tar.gz
	wget https://www.linuxfromscratch.org/patches/blfs/13.0/giflib-5.2.2-upstream_fixes-1.patch
	wget https://www.linuxfromscratch.org/patches/blfs/13.0/giflib-5.2.2-security_fixes-1.patch
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	pushd ..
	patch -Np1 -i ../giflib-5.2.2-upstream_fixes-1.patch
	patch -Np1 -i ../giflib-5.2.2-security_fixes-1.patch
	cp pic/gifgrid.gif doc/giflib-logo.gif
	popd
}

build() {
	pushd ..
	make -j$(nproc)
	ret=$?
	popd
	return $ret
}

install() {
	pushd ..

	make PREFIX=/usr install &&
	rm -fv /usr/lib/libgif.a &&
	find doc \( -name Makefile\* -o -name \*.1 \
        	-o -name \*.xml \) -exec rm -v {} \; &&
	/usr/bin/install -v -dm755 /usr/share/doc/${SOURCE_NAME} &&
	cp -v -R doc/* /usr/share/doc/${SOURCE_NAME}
	ret=$?
	popd
	return $ret
}

