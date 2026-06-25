export SOURCE_VERSION=1.22.2
export SOURCE_NAME=krb5-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://kerberos.org/dist/krb5/1.22/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
	wget https://www.linuxfromscratch.org/patches/blfs/13.0/mitkrb-1.22.2-upstream_fix-1.patch
}

prebuild() {
	pushd ..
	patch -Np1 -i ../mitkrb-1.22.2-upstream_fix-1.patch
	cd src &&
	sed -i -e '/eq 0/{N;s/12 //}' plugins/kdb/db2/libdb2/test/run.test &&

	../configure --prefix=/usr            \
		--sysconfdir=/etc        \
		--localstatedir=/var/lib \
		--runstatedir=/run       \
		--with-system-et         \
		--with-system-ss         \
		--with-system-verto=no   \
		--enable-dns-for-realm   \
		--disable-rpath
	ret=$?
	popd
	return $ret
}

build() {
	pushd ../src
	make -j$(nproc)
	ret=$?
	popd
	return $ret
}

install() {
	pushd ../src
	make install
	ret=$?
	popd
	return $ret
}

