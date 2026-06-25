export SOURCE_VERSION=1.21.2
export SOURCE_NAME=libheif-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/strukturag/libheif/releases/download/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
	wget https://www.linuxfromscratch.org/patches/blfs/13.0/libheif-1.21.2-svt_av1_build_fix-1.patch
}

prebuild() {
	pushd ..
	patch -Np1 -i ../libheif-1.21.2-svt_av1_build_fix-1.patch
	popd
	cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release  \
		-D WITH_GDK_PIXBUF=OFF       \
		-D WITH_OpenH264_DECODER=OFF \
		-D WITH_DAV1D=ON \
		-D WITH_JPEG_ENCODER=ON -D WITH_JPEG_DECODER=ON \
		-D WITH_OpenJPEG_ENCODER=ON -D WITH_OpenJPEG_DECODER=ON \
		-D WITH_SvtEnc=ON \
		-G Ninja ..
}

build() {
	ninja
}

install() {
	ninja install
}

