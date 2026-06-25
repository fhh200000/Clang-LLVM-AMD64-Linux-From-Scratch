export SOURCE_VERSION=9.0.3
export SOURCE_NAME=glu-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://archive.mesa3d.org/glu/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	meson setup ..                 \
		--prefix=/usr    \
		--buildtype=release      \
		-D default_library=shared \
		$(pkgconf opengl || echo -D gl_provider=gl) 
		
}

build() {
	ninja
}

install() {
	ninja install
}

