export SOURCE_VERSION=2.53.0
export SOURCE_NAME=git-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
        wget https://www.kernel.org/pub/software/scm/git/${SOURCE_NAME}.tar.xz
	tar -xf ${SOURCE_NAME}.tar.xz
}

prebuild() {
	pushd ..
	./configure --prefix=/usr                   \
		--with-gitconfig=/etc/gitconfig \
		--with-python=python3           \
		--with-libpcre2
	ret=$?
	popd
	return $ret
}

build() {
	pushd ..
	make -j$(nproc)
	ret=$?
	popd
	return $ret
}

install() {
	pushd ..
	make perllibdir=/usr/lib/perl5/5.42/site_perl install
	ret=$?
	popd
	return $ret
}

