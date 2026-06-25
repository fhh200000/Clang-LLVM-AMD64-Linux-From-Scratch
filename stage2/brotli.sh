export SOURCE_VERSION=1.2.0
export SOURCE_NAME=brotli-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://github.com/google/brotli/archive/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	cmake -D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release  \
		-G Ninja  ..
}

build() {
	ninja
}

install() {
	ninja install
	ret=$?
	pushd ..
	sed -e '/libraries +=/s/=.*/= [required_system_library[3:]]/' \
		-e '/package_configuration/d'                             \
		-e '/pkgconfig/d'                                         \
		-i setup.py

	USE_SYSTEM_BROTLI=1 \
		pip3 wheel -w dist --no-build-isolation --no-deps --no-cache-dir $PWD
	pip3 install --no-index --find-links dist --no-user Brotli
	popd
	return $ret

}

