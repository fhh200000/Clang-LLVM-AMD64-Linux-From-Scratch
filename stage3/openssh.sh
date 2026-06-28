#!/bin/bash

export SOURCE_VERSION="10.2p1"
export SOURCE_NAME=openssh-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	/usr/bin/install -v -g sys -m700 -d /var/lib/sshd &&

	groupadd -g 50 sshd        &&
	useradd  -c 'sshd PrivSep' \
		-d /var/lib/sshd  \
		-g sshd           \
		-s /bin/false     \
		-u 50 sshd
	../configure --prefix=/usr                            \
            --sysconfdir=/etc/ssh                    \
            --with-privsep-path=/var/lib/sshd        \
            --with-default-path=/usr/bin             \
            --with-superuser-path=/usr/bin           \
            --with-pid-dir=/run \
	    --with-libedit    \
	    --with-pam       \
	    --with-kerberos5=/usr

}

build() {
	make -j$(nproc)
}

install() {
	make install &&
		/usr/bin/install -v -m755    ../contrib/ssh-copy-id /usr/bin
	ret=$?
	echo "PermitRootLogin no" >> /etc/ssh/sshd_config
	sed 's@d/login@d/sshd@g' /etc/pam.d/login > /etc/pam.d/sshd &&
		chmod 644 /etc/pam.d/sshd &&
		echo "UsePAM yes" >> /etc/ssh/sshd_config
	pushd /usr/src/blfs-systemd-units
	make install-sshd
	systemctl enable sshd
	popd
	return $ret
}

