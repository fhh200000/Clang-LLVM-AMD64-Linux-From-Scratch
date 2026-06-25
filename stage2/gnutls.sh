export SOURCE_VERSION=3.8.12
export SOURCE_NAME=gnutls-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	../configure --prefix=/usr \
            --docdir=/usr/share/doc/gnutls-3.8.12 \
            --with-default-trust-store-pkcs11="pkcs11:"
}

build() {
	make -j$(nproc)
}

install() {
	make install
}

