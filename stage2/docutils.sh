export SOURCE_VERSION=0.22.4
export SOURCE_NAME=docutils-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://files.pythonhosted.org/packages/source/d/docutils/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	pushd ..
	for f in /usr/bin/rst*.py; do
		rm -fv /usr/bin/$(basename $f .py)
	done
	popd
}

build() {
	pushd ..
	pip3 wheel -w dist --no-build-isolation --no-deps --no-cache-dir $PWD
	popd
}

install() {
	pushd ..
	pip3 install --no-index --find-links dist --no-user docutils
	popd
}

