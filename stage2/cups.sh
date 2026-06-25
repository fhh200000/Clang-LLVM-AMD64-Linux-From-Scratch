export SOURCE_VERSION=2.4.16
export SOURCE_NAME=cups-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://github.com/OpenPrinting/cups/releases/download/v${SOURCE_VERSION}/${SOURCE_NAME}-source.tar.gz
	tar -xf ${SOURCE_NAME}-source.tar.gz
}

prebuild() {
	useradd -c "Print Service User" -d /var/spool/cups -g lp -s /bin/false -u 9 lp
	groupadd -g 19 lpadmin
	sed -i '/& ipp->prev)/s/prev/& \&\& ipp->prev->next == *attr/' ../cups/ipp.c
	pushd ..
	./configure --libdir=/usr/lib            \
            --with-rundir=/run/cups      \
            --with-system-groups=lpadmin \
	    --with-docdir=/usr/share/cups/odc-${SOURCE_VERSION}
	ret=$?
	popd
	return $ret
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
	make install
	ret=$?
	ln -svnf ../cups/doc-2.4.16 /usr/share/doc/cups-2.4.16
	echo "ServerName /run/cups/cups.sock" > /etc/cups/client.conf
	popd
	cat > /etc/pam.d/cups << "EOF"
# Begin /etc/pam.d/cups

auth    include system-auth
account include system-account
session include system-session

# End /etc/pam.d/cups
EOF
	systemctl enable cups
	return $ret
}

