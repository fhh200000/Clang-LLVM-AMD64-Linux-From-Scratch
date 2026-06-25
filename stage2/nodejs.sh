export SOURCE_VERSION=v22.22.0
export SOURCE_NAME=node-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://nodejs.org/dist/${SOURCE_VERSION}/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
	wget https://www.linuxfromscratch.org/patches/blfs/13.0/node-v22.22.0-python_build_fix-1.patch
}

prebuild() {
	pushd ..
	patch -Np1 -i ../node-v22.22.0-python_build_fix-1.patch
	CC=cc CXX=c++ ./configure --prefix=/usr          \
            --shared-brotli        \
            --shared-cares         \
            --shared-libuv         \
            --shared-openssl       \
            --shared-nghttp2       \
            --shared-zlib          \
            --with-intl=system-icu
	ret=$?
	popd
	return $ret
}

build() {
	pushd ..
	export LIBATOMIC_EXISTS=1
	if [ ! -e /usr/lib/libatomic.a ]; then
		export LIBATOMIC_EXISTS=0
		touch /usr/lib/libatomic.a
	fi
	make -j$(nproc)
	ret=$?
	popd
	return $?
}

install() {
	pushd ..
	make install
	ret=$?
	ln -sf node /usr/share/doc/node-22.22.0
	popd
	if [ "x$LIBATOMIC_EXISTS" == "x0" ]; then
		rm /usr/lib/libatomic.a
	fi
	unset LIBATOMIC_EXISTS
	return $?
}

