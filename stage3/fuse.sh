export SOURCE_VERSION=3.18.1
export SOURCE_NAME=fuse-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget  https://github.com/libfuse/libfuse/releases/download/${SOURCE_NAME}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	sed -i '/^udev/,$ s/^/#/' ../util/meson.build
	meson setup --prefix=/usr --buildtype=release ..
}

build() {
	ninja
}

install() {
	ninja install && chmod u+s /usr/bin/fusermount3
	ret=$?
	cat > /etc/fuse.conf << "EOF"
# Set the maximum number of FUSE mounts allowed to non-root users.
# The default is 1000.
#
#mount_max = 1000

# Allow non-root users to specify the 'allow_other' or 'allow_root'
# mount options.
#
#user_allow_other
EOF
	return $ret
}

