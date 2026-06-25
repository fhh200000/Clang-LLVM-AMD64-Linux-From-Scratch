export SOURCE_VERSION=17.0
export SOURCE_NAME=pulseaudio-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://www.freedesktop.org/software/pulseaudio/releases/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	LDFLAGS="${LDFLAGS} -Wl,--undefined-version" meson setup --prefix=/usr       \
            --buildtype=release \
            -D database=gdbm    \
            -D doxygen=false    \
            -D bluez5=disabled  \
            -D tests=false      \
            .. 
}

build() {
	ninja
}

install() {
	ninja install
	rm /usr/share/dbus-1/system.d/pulseaudio-system.conf
}


