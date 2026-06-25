export SOURCE_VERSION=1.56.0
export SOURCE_NAME=NetworkManager-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/${SOURCE_VERSION}/downloads/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	pushd ..
	grep -rl '^#!.*python$' | xargs sed -i '1s/python/&3/'
	popd
	LDFLAGS="${LDFLAGS} -Wl,--allow-shlib-undefined" meson setup ..                    \
		--prefix=/usr               \
		--buildtype=release         \
		-D libaudit=no              \
		-D nmtui=true               \
		-D ppp=false                \
		-D selinux=false            \
		-D qt=false                 \
		-D session_tracking=systemd \
		-D man=false
}

build() {
	ninja
}

install() {
	ninja install
	ret=$?
	cat >> /etc/NetworkManager/NetworkManager.conf << "EOF"
[main]
plugins=keyfile
EOF
	cat > /etc/NetworkManager/conf.d/polkit.conf << "EOF"
[main]
auth-polkit=true
EOF
	cat > /etc/NetworkManager/conf.d/no-dns-update.conf << "EOF"
[main]
dns=none
EOF
	groupadd -fg 86 netdev

	cat > /usr/share/polkit-1/rules.d/org.freedesktop.NetworkManager.rules << "EOF"
polkit.addRule(function(action, subject) {
    if (action.id.indexOf("org.freedesktop.NetworkManager.") == 0 && subject.isInGroup("netdev")) {
        return polkit.Result.YES;
    }
});
EOF
	systemctl enable NetworkManager
	return $ret
}

