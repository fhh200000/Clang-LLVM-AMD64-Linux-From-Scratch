export SOURCE_VERSION=1.3.0
export SOURCE_NAME=libavif-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/AOMediaCodec/libavif/archive/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	sed 's/enable_adaptive_quantization/aq_mode/' -i ../src/codec_svt.c
	cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release  \
		-D AVIF_CODEC_AOM=SYSTEM     \
		-D AVIF_CODEC_DAV1D=SYSTEM   \
		-D AVIF_CODEC_SVT=SYSTEM     \
		-D AVIF_BUILD_GDK_PIXBUF=OFF \
		-D AVIF_LIBYUV=OFF           \
		-G Ninja ..
}

build() {
	ninja
}

install() {
	ninja install
}

