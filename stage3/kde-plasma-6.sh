#!/bin/bash

export SOURCE_VERSION="6.7.1"
export SOURCE_NAME=kde-plasma-6-${SOURCE_VERSION}
export SCRIPT_DIR=$(pwd)

download() {
	mkdir -p kde-plasma-6-${SOURCE_VERSION}
	pushd kde-plasma-6-${SOURCE_VERSION}
	wget -r -nH -nd -A '*.xz' -np https://download.kde.org/stable/plasma/${SOURCE_VERSION}/
	cat > plasma-${SOURCE_VERSION}.md5 << "EOF"
0cf0eb10ba1dbbfce3587cb060c001d1  kdecoration-6.7.1.tar.xz
056de7c25b3800156a44e5068d157f93  libkscreen-6.7.1.tar.xz
c5178332f1cebdf7dc7fe959cee295a7  libksysguard-6.7.1.tar.xz
810e868a5edde14508050907a3321e3e  breeze-6.7.1.tar.xz
259625115475e78d2478e591c58c35f0  breeze-gtk-6.7.1.tar.xz
240d9cb042635db21f2da9f96fae0801  layer-shell-qt-6.7.1.tar.xz
669c150d583bbd1eb3f68e099a099217  plasma-activities-6.7.1.tar.xz
ea2a1751171db63465e4f04693e4f937  libplasma-6.7.1.tar.xz
15a23619befdd4300051023cf4d9e005  kscreenlocker-6.7.1.tar.xz
b7b51a85268b40ce10eaeac33de2df84  kglobalacceld-6.7.1.tar.xz
e5a7c67483ce0e0264f6f1c4d3c299db  kwayland-6.7.1.tar.xz
84038abb3812315a4bd43e4c63895d48  aurorae-6.7.1.tar.xz
6c0fb77944a6be72ed82c48f51bfe0a1  knighttime-6.7.1.tar.xz
f2cd0bafa2b249e4324327cb561329ce  plasma-keyboard-6.7.1.tar.xz
#baca37bd7f2d303207fa612ca926df46  kwin-x11-6.7.1.tar.xz
59477f7e3cc8fb106bf75477321c862c  kwin-6.7.1.tar.xz
4c4657268eb334930d67301914505128  plasma5support-6.7.1.tar.xz
cfaed473b18649380d95cc902bf854fb  plasma-activities-stats-6.7.1.tar.xz
f3eeb742ab68b350818a0bf8d5130240  kpipewire-6.7.1.tar.xz
6a379f2e8af731a44d3f8cc048bc6aca  plasma-workspace-6.7.1.tar.xz
25162eadbb53bd6899888a4cba6b4a5e  plasma-disks-6.7.1.tar.xz
6984ec1ed74a25c807655f69978dbe97  bluedevil-6.7.1.tar.xz
db1282b808041909df4c4950e58d3eb4  kde-gtk-config-6.7.1.tar.xz
e950e0db343d59f2524a9adb046c1c66  kmenuedit-6.7.1.tar.xz
a6275628e56b3f23f8d8dd003b1ad6f4  kscreen-6.7.1.tar.xz
e2c6f6cff25ce33fae74b5e1d7cde6b5  kwallet-pam-6.7.1.tar.xz
435022c3d99004b0599716fb67433060  kwrited-6.7.1.tar.xz
c2f16354172e12ea0e3760bcb932d2fd  milou-6.7.1.tar.xz
fb13caaecff5bbae3964ba11cd119351  plasma-nm-6.7.1.tar.xz
06936e42da166f948dc41525340f7a9b  plasma-pa-6.7.1.tar.xz
1c872d91dcb3b36867acadb9f0dc6a36  plasma-workspace-wallpapers-6.7.1.tar.xz
d859f149d2db6095a2d7c20ded3ecfa9  polkit-kde-agent-1-6.7.1.tar.xz
c36d8038eb2dddc188d90a02c92c2cba  powerdevil-6.7.1.tar.xz
859421a7015b4fde50fe739c1848a6d7  plasma-desktop-6.7.1.tar.xz
#a25d8db2a5b9418de8bed9c9818c0c63  kgamma-6.7.1.tar.xz
e4866c94d8b612495a1e2201b4b61a30  ksshaskpass-6.7.1.tar.xz
#5a55bfb15b9081a4141df073b79db46c  plasma-sdk-6.7.1.tar.xz
2a84274c4dc7e56cd69492b2dec811e8  sddm-kcm-6.7.1.tar.xz
#a8fa88c2e0b31b8edb6f33f5a0e98297  discover-6.7.1.tar.xz
#d9914088b078018583811feaa8b87d68  breeze-grub-6.7.1.tar.xz
#13bfe6ba3974204757a64a5bab140855  breeze-plymouth-6.7.1.tar.xz
b820d2509fe2ee7449cba85ad092321d  kactivitymanagerd-6.7.1.tar.xz
5329603599452a876fe2c372ecf7d19c  plasma-integration-6.7.1.tar.xz
#ad35a08d2630ce06181d2558893bda7d  plymouth-kcm-6.7.1.tar.xz
60b9a4218ef89b357468410b59b09767  xdg-desktop-portal-kde-6.7.1.tar.xz
0eff906884d60be8d3286e910a1a284f  drkonqi-6.7.1.tar.xz
8cf034bac0a9299c875894256f4b5249  plasma-vault-6.7.1.tar.xz
#b75504b96a69c31a4545a1add556a77c  plasma-browser-integration-6.7.1.tar.xz
b90415170d88aab9e681c98d386decce  kde-cli-tools-6.7.1.tar.xz
dc9b43e261663a4bdc03e426dd8d8928  systemsettings-6.7.1.tar.xz
#08ee4d2a581cb3da1adfb977af026b5e  plasma-mobile-6.7.1.tar.xz
#783da17436e7f2821416bfe4fd313d7d  plasma-nano-6.7.1.tar.xz
b6cbc3b1df1935352a8cb1dc228c1522  plasma-firewall-6.7.1.tar.xz
7288aa4b55a8638d7d68ed3c75a82bd3  plasma-systemmonitor-6.7.1.tar.xz
fd658148d1ef48165d71211aca6996ff  qqc2-breeze-style-6.7.1.tar.xz
82f47686afe84d588170b8ef25e7d5d9  ksystemstats-6.7.1.tar.xz
00586eac8931aac2cb100d1292912269  oxygen-sounds-6.7.1.tar.xz
66f2a999e05a95337848ebada2066066  kdeplasma-addons-6.7.1.tar.xz
#6cef2c489db67ce9b2d2b7e98642276c  flatpak-kcm-6.7.1.tar.xz
dddebb14cb2dccd54b2cd1330bfbb902  plasma-welcome-6.7.1.tar.xz
171824c3a01f1cca92ca7656a8966f12  ocean-sound-theme-6.7.1.tar.xz
9a30e7e32c49b4803964a5db4a6651ae  print-manager-6.7.1.tar.xz
#e148122ca9b3ba8c7c2d987a9f868996  wacomtablet-6.7.1.tar.xz
#1fa312aba20a324cf80c518ca1492ac3  kwayland-integration-6.7.1.tar.xz
#1ba75a49135a02d8b10921f078204284  krdp-6.7.1.tar.xz
3a2ab62c41d920fb8d55f5865824fa07  oxygen-6.7.1.tar.xz
#40d49bde14b36458adc281954cc7584e  plasma-dialer-6.7.1.tar.xz
#d4d9b418f58fdcc548fe2ebb2a3916d9  spacebar-6.7.1.tar.xz
0e46da696e3b1bc3a15bd82bd00b3586  spectacle-6.7.1.tar.xz
9a481f658c1d78d0266a9141ff67bd8f  plasma-login-manager-6.7.1.tar.xz
c58302756f0110c413cd38966d9ff85d  plasma-setup-6.7.1.tar.xz
67d66aadd3850a16577dbb86be22ae26  kinfocenter-6.7.1.tar.xz
eab4c845879880ca984d78c9e4075bd0  union-6.7.1.tar.xz
c20e6cfc26eb8a2a0a442ea124a8496a  plasma-bigscreen-6.7.1.tar.xz
43efde31dddf22ddb167e1971cf81598  plasma-thunderbolt-6.7.1.tar.xz
EOF
	popd
}

prebuild() {	
	return 0
}

build() {
	while read -r line; do
		if [ -z "$line" ]; then continue; fi
		# Get the file name, ignoring comments and blank lines
		file=$(echo $line | cut -d" " -f2)
		if $(echo $line | grep -E -q '^ *$|^#' ); then
			echo "==> Package ${file} SKIP"
			continue
		fi

		pkg=$(echo $file|sed 's|^.*/||')          # Remove directory
		packagedir=$(echo $pkg|sed 's|\.tar.*||') # Package directory

		name=$(echo $pkg|sed 's|-6.*$||') # Isolate package name
		echo "==> Package ${file} BEGIN"

		rm -rf $packagedir
		tar -xf ../$file
		pushd $packagedir
		
		case $name in
			libkscreen)
				patch -Np1 -i ${SCRIPT_DIR}/libkscreen-remove-x11.patch
				;;
			libplasma)
				patch -Np1 -i ${SCRIPT_DIR}/libplasma-remove-x11.patch
				;;
			kscreenlocker)
				patch -Np1 -i ${SCRIPT_DIR}/kscreenlocker-remove-x11.patch
				;;
			kwin)
				patch -Np1 -i ${SCRIPT_DIR}/kwin-remove-x11.patch
				;;
			plasma-workspace)
				patch -Np1 -i ${SCRIPT_DIR}/plasma-workspace-remove-x11.patch
				;;
			bluedevil)
				patch -Np1 -i ${SCRIPT_DIR}/bluedevil-remove-x11.patch
				;;
			kde-gtk-config)
				patch -Np1 -i ${SCRIPT_DIR}/kde-gtk-config-remove-x11.patch
				;;
			kscreen)
				patch -Np1 -i ${SCRIPT_DIR}/kscreen-remove-x11.patch
				;;
			plasma-nm)
				patch -Np1 -i ${SCRIPT_DIR}/plasma-nm-remove-x11.patch
				;;
			polkit-kde-agent-1)
				patch -Np1 -i ${SCRIPT_DIR}/polkit-kde-agent-1-remove-x11.patch
				;;
			powerdevil)
				patch -Np1 -i ${SCRIPT_DIR}/powerdevil-remove-x11.patch
				;;
			plasma-desktop)
				patch -Np1 -i ${SCRIPT_DIR}/plasma-desktop-remove-x11.patch
				;;
			plasma-integration)
				patch -Np1 -i ${SCRIPT_DIR}/plasma-integration-remove-x11.patch
				;;
			kde-cli-tools)
				patch -Np1 -i ${SCRIPT_DIR}/kde-cli-tools-remove-x11.patch
				;;
			print-manager)
				patch -Np1 -i ${SCRIPT_DIR}/print-manager-remove-x11.patch
				;;
			plasma-workspace)
				patch -Np1 -i ${SCRIPT_DIR}/plasma-workspace-remove-x11.patch
				;;
			oxygen)
				patch -Np1 -i ${SCRIPT_DIR}/oxygen-remove-x11.patch
				;;
			plasma-login-manager)
				patch -Np1 -i ${SCRIPT_DIR}/plasma-login-manager-remove-x11.patch
				;;
			plasma-setup)
				patch -Np1 -i ${SCRIPT_DIR}/plasma-setup-remove-x11.patch
				;;
		esac
		mkdir build
	       	cd    build

		cmake -D CMAKE_INSTALL_PREFIX=/usr          \
			-D CMAKE_INSTALL_LIBEXECDIR=libexec \
			-D CMAKE_BUILD_TYPE=Release         \
			-D BUILD_QT5=OFF                    \
			-D BUILD_TESTING=OFF                \
			-D WITH_X11=OFF                     \
			-D KWIN_BUILD_X11=OFF               \
			-D WITH_X11_SESSION=OFF             \
			-D BUILD_KCM_MOUSE_X11=OFF          \
			-D BUILD_KCM_TOUCHPAD_X11=OFF       \
			-D PAM_OS_CONFIGURATION=arch        \
			-W no-dev ..
		ret=$?
		if [ $ret -ne 0 ]; then
			popd
			return $ret
		fi
		make -j$(nproc)
		ret=$?
		if [ $ret -ne 0 ]; then
			popd
			return $ret
		fi
		make install
		ret=$?
		if [ $ret -ne 0 ]; then
			popd
			return $ret
		fi

		popd
		rm -rf $packagedir
		sed -i "s/${line}/#${line}/g" ../plasma-${SOURCE_VERSION}.md5
	done < ../plasma-${SOURCE_VERSION}.md5
}

install() {
	useradd -r plasmalogin -u 958 -c "PLASMALOGIN Greeter Account" -d /var/lib/plasmalogin -s /usr/bin/nologin
	cat > /etc/pam.d/system-login << EOF
#%PAM-1.0

auth       required   pam_shells.so
auth       requisite  pam_nologin.so
auth       include    system-auth

account    required   pam_access.so
account    required   pam_nologin.so
account    include    system-auth

password   include    system-auth

session    optional   pam_loginuid.so
session    optional   pam_keyinit.so       force revoke
session    include    system-auth
session    optional   pam_lastlog2.so      silent
session    optional   pam_motd.so
session    optional   pam_mail.so          dir=/var/spool/mail standard quiet
session    optional   pam_umask.so
-session   optional   pam_systemd.so
session    required   pam_env.so

EOF
	systemctl enable plasmalogin
	return 0
}

