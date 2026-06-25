export SOURCE_VERSION=1.7.0
export SOURCE_NAME=libglvnd-v${SOURCE_VERSION}-faa23f21fc677af5792825dc30cb1ccef4bf33a6
export SCRIPT_DIR=$(pwd)

download() {
        wget https://gitlab.freedesktop.org/glvnd/libglvnd/-/archive/v${SOURCE_VERSION}/libglvnd-${SOURCE_VERSION}.tar.gz
	tar -xf libglvnd-${SOURCE_VERSION}.tar.gz
}

prebuild() {
	meson setup --prefix=/usr       \
		--buildtype=release \
		-D hgl=false        \
		.. 
}

build() {
	ninja
}

install() {
	ninja install
	if [ ! -e "/lib/libGL.so" ];then
		echo "INPUT( -lOpenGL )" > /lib/libGL.so
	fi
}

