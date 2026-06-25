export SOURCE_VERSION=2.11
export SOURCE_NAME=wpa_supplicant-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://w1.fi/releases/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	pushd ..
	cat > wpa_supplicant/.config << "EOF"
CONFIG_BACKEND=file
CONFIG_CTRL_IFACE=y
CONFIG_DEBUG_FILE=y
CONFIG_DEBUG_SYSLOG=y
CONFIG_DEBUG_SYSLOG_FACILITY=LOG_DAEMON
CONFIG_DRIVER_NL80211=y
CONFIG_DRIVER_WEXT=y
CONFIG_DRIVER_WIRED=y
CONFIG_EAP_GTC=y
CONFIG_EAP_LEAP=y
CONFIG_EAP_MD5=y
CONFIG_EAP_MSCHAPV2=y
CONFIG_EAP_OTP=y
CONFIG_EAP_PEAP=y
CONFIG_EAP_TLS=y
CONFIG_EAP_TTLS=y
CONFIG_IEEE8021X_EAPOL=y
CONFIG_IPV6=y
CONFIG_LIBNL32=y
CONFIG_PEERKEY=y
CONFIG_PKCS12=y
CONFIG_READLINE=y
CONFIG_SMARTCARD=y
CONFIG_WPS=y
CFLAGS += -I/usr/include/libnl3
CONFIG_CTRL_IFACE_DBUS=y
CONFIG_CTRL_IFACE_DBUS_NEW=y
CONFIG_CTRL_IFACE_DBUS_INTRO=y
EOF
	popd
}

build() {
	pushd ../wpa_supplicant &&
	make BINDIR=/usr/sbin LIBDIR=/usr/lib
	ret=$?
	popd
	return $ret
}

install() {
	pushd ../wpa_supplicant
	/usr/bin/install -v -m755 wpa_{cli,passphrase,supplicant} /usr/sbin/ &&
	/usr/bin/install -v -m644 doc/docbook/wpa_supplicant.conf.5 /usr/share/man/man5/ &&
	/usr/bin/install -v -m644 doc/docbook/wpa_{cli,passphrase,supplicant}.8 /usr/share/man/man8/

	/usr/bin/install -v -m644 systemd/*.service /usr/lib/systemd/system/
	/usr/bin/install -v -m644 dbus/fi.w1.wpa_supplicant1.service \
                 /usr/share/dbus-1/system-services/ &&
	/usr/bin/install -v -d -m755 /etc/dbus-1/system.d &&
	/usr/bin/install -v -m644 dbus/dbus-wpa_supplicant.conf \
                 /etc/dbus-1/system.d/wpa_supplicant.conf
	popd
}

