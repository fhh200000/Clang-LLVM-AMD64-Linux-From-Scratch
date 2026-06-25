export SOURCE_VERSION=1.4.0
export SOURCE_NAME=dbus-python-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://dbus.freedesktop.org/releases/dbus-python//${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	return 0
}
build() {
	pushd ..
	pip3 wheel -w dist --no-build-isolation --no-deps --no-cache-dir $PWD
	popd
}

install() {
	pushd ..
	pip3 install --no-index --find-links dist --no-user dbus-python
	popd
}

