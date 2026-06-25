export SOURCE_VERSION=5.86
export SOURCE_NAME=bluez-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://www.kernel.org/pub/linux/bluetooth/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	sed -i '4967,4968d' ../src/adapter.c
	../configure --prefix=/usr         \
            --sysconfdir=/etc     \
            --localstatedir=/var  \
            --enable-library
}

build() {
	make -j$(nproc)
}

install() {
	make install
	ret=$?
	ln -svf ../libexec/bluetooth/bluetoothd /usr/sbin
	/usr/bin/install -v -dm555 /etc/bluetooth &&
	/usr/bin/install -v -m644 src/main.conf /etc/bluetooth/main.conf
	return $ret
}


