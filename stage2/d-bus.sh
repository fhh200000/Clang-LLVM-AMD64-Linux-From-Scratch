#!/bin/bash

export SOURCE_VERSION="1.16.2"
export SOURCE_NAME=dbus-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://dbus.freedesktop.org/releases/dbus/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	meson setup --prefix=/usr --buildtype=release --wrap-mode=nofallback ..
	return $?
}

build() {
        ninja -j$(nproc)
	return $?
}

install() {
        ninja install
	ret=$?
	chown -v root:messagebus /usr/libexec/dbus-daemon-launch-helper &&
	chmod -v      4750       /usr/libexec/dbus-daemon-launch-helper
	if [ -e /usr/share/doc/dbus ]; then
		rm -rf /usr/share/doc/dbus-1.16.2    &&
		mv -v  /usr/share/doc/dbus{,-1.16.2}
	fi
	cat > /etc/dbus-1/session-local.conf << "EOF"
<!DOCTYPE busconfig PUBLIC
 "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
 "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
<busconfig>

  <!-- Search for .service files in /usr/local -->
  <servicedir>/usr/local/share/dbus-1/services</servicedir>

</busconfig>
EOF
	return $ret
}

