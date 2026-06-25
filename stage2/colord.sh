export SOURCE_VERSION=1.4.8
export SOURCE_NAME=colord-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://www.freedesktop.org/software/colord/releases/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	meson setup ..                  \
		--prefix=/usr             \
		--buildtype=release       \
		-D daemon_user=colord     \
		-D vapi=true              \
		-D systemd=true           \
		-D libcolordcompat=true   \
		-D argyllcms_sensor=false \
		-D bash_completion=false  \
		-D docs=false             \
		-D man=false
}

build() {
	ninja
}

install() {
	groupadd -g 71 colord &&
		useradd -c "Color Daemon Owner" -d /var/lib/colord -u 71 \
		-g colord -s /bin/false colord
	ninja install
}

