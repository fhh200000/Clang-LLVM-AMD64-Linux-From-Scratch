export SOURCE_VERSION=6.11.1
export SOURCE_NAME=qtwebengine-everywhere-src-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://download.qt.io/archive/qt/6.11/${SOURCE_VERSION}/submodules/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	pushd ..
	sed -e '/ifndef SYS_SECCOMP/,+2 d' \
		-i src/3rdparty/chromium/sandbox/linux/system_headers/linux_seccomp.h
	patch -Np1 -i ${SCRIPT_DIR}/qtwebengine-remove-gl.diff
	popd
	cmake -D CMAKE_MESSAGE_LOG_LEVEL=STATUS             \
		-D QT_FEATURE_webengine_system_ffmpeg=ON      \
		-D QT_FEATURE_webengine_system_icu=ON         \
		-D QT_FEATURE_webengine_proprietary_codecs=ON \
		-D QT_FEATURE_webengine_webrtc_pipewire=ON    \
		-D QT_BUILD_EXAMPLES_BY_DEFAULT=OFF           \
		-D QT_GENERATE_SBOM=OFF                       \
		-G Ninja ..
}

build() {
	export LIBATOMIC_EXISTS=1
        if [ ! -e /usr/lib/libatomic.a ]; then
                export LIBATOMIC_EXISTS=0
                touch /usr/lib/libatomic.a
        fi
	ninja
}

install() {
	ninja install
        if [ "x$LIBATOMIC_EXISTS" == "x0" ]; then
                rm /usr/lib/libatomic.a
        fi
        unset LIBATOMIC_EXISTS
}

