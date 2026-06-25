export SOURCE_VERSION=2.1.28
export SOURCE_NAME=cyrus-sasl-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/cyrusimap/cyrus-sasl/releases/download/${SOURCE_NAME}/${SOURCE_NAME}.tar.gz
	wget https://www.linuxfromscratch.org/patches/blfs/13.0/cyrus-sasl-2.1.28-gcc15_fixes-1.patch
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	pushd ..
	patch -Np1 -i ../cyrus-sasl-2.1.28-gcc15_fixes-1.patch
	autoconf -fiv
	sed '/saslint/a #include <time.h>'       -i lib/saslutil.c
	sed '/plugin_common/a #include <time.h>' -i plugins/cram.c
	popd
	../configure --prefix=/usr                       \
	       	--sysconfdir=/etc                   \
		--enable-auth-sasldb              \
		--with-dblib=lmdb                   \
		--with-dbpath=/var/lib/sasl/sasldb2 \
		--with-sphinx-build=no              \
		--with-saslauthd=/var/run/saslauthd
}

build() {
	make -j1
}

install() {
	make install
}

