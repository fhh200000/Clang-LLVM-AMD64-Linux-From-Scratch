#!/bin/bash

export SOURCE_VERSION="1.4.5"
export SOURCE_NAME=libpwquality-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://github.com/libpwquality/libpwquality/releases/download/${SOURCE_NAME}/${SOURCE_NAME}.tar.bz2
	tar -xf ${SOURCE_NAME}.tar.bz2
}

prebuild() {
	../configure --prefix=/usr                      \
            --disable-static                   \
            --with-securedir=/usr/lib/security \
	    --disable-python-bindings
}

build() {
	make -j$(nproc)
}

install() {
	make install
	if [ $? -ne 0 ]; then
		return $?
	fi
	pushd ..
	pip3 wheel -w dist --no-build-isolation --no-deps --no-cache-dir $PWD/python &&
		pip3 install --no-index --find-links dist --no-user pwquality
	popd
	cat > /etc/pam.d/system-password << "EOF"
# Begin /etc/pam.d/system-password

# check new passwords for strength (man pam_pwquality)
password  required    pam_pwquality.so   authtok_type=UNIX retry=1 difok=1 \
                                         minlen=8 dcredit=0 ucredit=0      \
                                         lcredit=0 ocredit=0 minclass=1    \
                                         maxrepeat=0 maxsequence=0         \
                                         maxclassrepeat=0 gecoscheck=0     \
                                         dictcheck=1 usercheck=1           \
                                         enforcing=1 badwords=""           \
                                         dictpath=/usr/lib/cracklib/pw_dict

# use yescrypt hash for encryption, use shadow, and try to use any
# previously defined authentication token (chosen password) set by any
# prior module.
password  required    pam_unix.so        yescrypt shadow try_first_pass

# End /etc/pam.d/system-password
EOF
	return $ret
}

