export SOURCE_VERSION=127
export SOURCE_NAME=polkit-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/polkit-org/polkit/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	groupadd -fg 27 polkitd &&
	useradd -c "PolicyKit Daemon Owner" -d /etc/polkit-1 -u 27 \
		-g polkitd -s /bin/false polkitd
	meson setup ..                   \
                --prefix=/usr              \
                --buildtype=release        \
                -D man=false                \
                -D session_tracking=logind \
                -D tests=true

}

build() {
	ninja
}
install() {
	ninja install
}
