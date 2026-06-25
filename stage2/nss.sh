export SOURCE_VERSION=3.120.1
export SOURCE_NAME=nss-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://archive.mozilla.org/pub/security/nss/releases/NSS_3_120_1_RTM/src/${SOURCE_NAME}.tar.gz
	wget https://www.linuxfromscratch.org/patches/blfs/13.0/nss-standalone-1.patch
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	pushd ..
	patch -Np1 -i ../nss-standalone-1.patch
	ret=$?
	popd
	return $ret
}
build() {
	pushd ../
	mkdir overlay
	cd overlay
	ln -s /usr/bin/cc gcc
	ln -s /usr/bin/c++ g++
	cd ../nss
	PATH=$(realpath ../overlay):${PATH} make BUILD_OPT=1                      \
		NSPR_INCLUDE_DIR=/usr/include/nspr  \
		USE_SYSTEM_ZLIB=1                   \
		ZLIB_LIBS=-lz                       \
		NSS_ENABLE_WERROR=0                 \
  		NSS_USE_SYSTEM_SQLITE=1             \
		USE_64=1
	ret=$?
	popd
	return $ret
}

install() {
	pushd ../dist

	/usr/bin/install -v -m755 Linux*/lib/*.so              /usr/lib              &&
	/usr/bin/install -v -m644 Linux*/lib/{*.chk,libcrmf.a} /usr/lib              &&

	/usr/bin/install -v -m755 -d                           /usr/include/nss      &&
	cp -v -RL {public,private}/nss/*              /usr/include/nss      &&

	/usr/bin/install -v -m755 Linux*/bin/{certutil,nss-config,pk12util} /usr/bin &&

	/usr/bin/install -v -m644 Linux*/lib/pkgconfig/nss.pc  /usr/lib/pkgconfig
	ln -sfv ./pkcs11/p11-kit-trust.so /usr/lib/libnssckbi.so
	popd
}

