#!/bin/bash

export SOURCE_VERSION="259.1"
export SOURCE_NAME=systemd-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	wget https://github.com/systemd/systemd/archive/v${SOURCE_VERSION}/${SOURCE_NAME}.tar.gz
	tar -xf ${SOURCE_NAME}.tar.gz
}

prebuild() {
	sed -e 's/GROUP="render"/GROUP="video"/' \
		-e 's/GROUP="sgx", //'               \
		-i ../rules.d/50-udev-default.rules.in
		meson setup ..                 \
			--prefix=/usr            \
			--buildtype=release      \
			-D default-dnssec=no     \
			-D firstboot=false       \
			-D install-tests=false   \
			-D ldconfig=false        \
			-D man=false             \
			-D sysusers=false        \
			-D rpmmacrosdir=no       \
			-D homed=disabled        \
			-D mode=release          \
			-D pam=enabled           \
			-D pamconfdir=/etc/pam.d \
			-D dev-kvm-mode=0660     \
			-D nobody-group=nogroup  \
			-D sysupdate=disabled    \
			-D ukify=disabled        \
			-D docdir=/usr/share/doc/systemd-259.1
	return $?
}

build() {
        ninja -j$(nproc)
	return $?
}

install() {
        ninja install
	ret=$?
	cat >> /etc/pam.d/system-session << "EOF"
# Begin Systemd addition

session  required    pam_loginuid.so
session  optional    pam_systemd.so

# End Systemd addition
EOF

	cat > /etc/pam.d/systemd-user << "EOF"
# Begin /etc/pam.d/systemd-user

account  required    pam_access.so
account  include     system-account

session  required    pam_env.so
session  required    pam_limits.so
session  required    pam_loginuid.so
session  optional    pam_keyinit.so force revoke
session  optional    pam_systemd.so

auth     required    pam_deny.so
password required    pam_deny.so

# End /etc/pam.d/systemd-user
EOF
	systemctl daemon-reexec
	/usr/bin/install -vdm755 /etc/systemd/user-environment-generators &&
	cat > /etc/systemd/user-environment-generators/50-profile.sh << "EOF" &&
#!/usr/bin/env -S -i /usr/bin/bash
# SPDX-License-Identifier: MIT

. /etc/profile

# Systemd should have already set a better value for them.
unset XDG_RUNTIME_DIR
for i in $(locale); do
  unset ${i%=*}
done

# Some shell magic that we don't want to expose.
unset SHLVL

# Systemd does not want to pass functions to the environment
for i in $(declare -pF | awk '{print $3}'); do
  unset -f $i
done

python3 << _EOF
import os
for var in os.environ:
  # Simply unsetting them in shell does not work.
  if var in ['LC_CTYPE', '_']:
    continue

  print(var + '=' + os.environ[var])
_EOF
EOF

	chmod -v 755 /etc/systemd/user-environment-generators/50-profile.sh
	touch /etc/profile
	systemctl --user unset-environment \
  		$(/etc/systemd/user-environment-generators/50-profile.sh | sed 's/=.*//')
	systemctl --user daemon-reload
	return $ret
}

