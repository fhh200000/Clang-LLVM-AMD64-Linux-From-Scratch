export SOURCE_VERSION=2.6.12
export SOURCE_NAME=openldap-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://www.openldap.org/software/download/OpenLDAP/openldap-release/${SOURCE_NAME}.tgz
	wget https://www.linuxfromscratch.org/patches/blfs/13.0/openldap-2.6.12-consolidated-1.patch
	tar -xf ${SOURCE_NAME}.tgz
}

prebuild() {
	pushd ..
	patch -Np1 -i ../openldap-2.6.12-consolidated-1.patch
	autoconf
	popd
	LDFLAGS="${LDFLAGS} -Wl,--undefined-version" ../configure --prefix=/usr     \
	       	--sysconfdir=/etc \
		--disable-static  \
		--enable-dynamic  \
		--disable-debug   \
		--disable-slapd
}

build() {
	make depend
	make -j$(nproc)
}

install() {
	make install
}

