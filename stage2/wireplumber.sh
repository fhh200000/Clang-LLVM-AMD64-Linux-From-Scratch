export SOURCE_VERSION=0.5.13
export SOURCE_NAME=wireplumber-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://gitlab.freedesktop.org/pipewire/wireplumber/-/archive/${SOURCE_VERSION}/${SOURCE_NAME}.tar.bz2
	tar -xf ${SOURCE_NAME}.tar.bz2
}

prebuild() {
	meson setup --prefix=/usr --buildtype=release -D system-lua=true ..
}

build() {
	ninja
}

install() {
	ninja install
	rm -vf /etc/xdg/autostart/pulseaudio.desktop         &&
	rm -vf /etc/xdg/Xwayland-session.d/00-pulseaudio-x11 &&
	sed -e '$a autospawn = no' -i /etc/pulse/client.conf
	systemctl enable --global pipewire.socket       &&
	systemctl enable --global pipewire-pulse.socket &&
	systemctl enable --global wireplumber
}

