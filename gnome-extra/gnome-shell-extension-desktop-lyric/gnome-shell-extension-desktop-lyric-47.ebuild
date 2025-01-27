# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit gnome2-utils meson

DESCRIPTION="Show the lyric of playing songs on the desktop."
HOMEPAGE="https://github.com/tuberry/desktop-lyric"
SRC_URI="https://github.com/tuberry/desktop-lyric/archive/${PV}.beta.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/desktop-lyric-${PV}.beta"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	app-eselect/eselect-gnome-shell-extensions
	=gnome-base/gnome-shell-${PV%.*}*
"

extension_uuid="desktop-lyric@tuberry"

src_configure() {
	emesonargs=("-Dtarget=system")
	meson_src_configure
}

src_prepare() {
	default
	echo -e "#!/usr/bin/env bash\necho \"45.0\"" > ${S}/cli/get-version.sh
}

pkg_preinst() {
	gnome2_schemas_savelist
}

pkg_postinst() {
	gnome2_schemas_update
	ebegin "Updating list of installed extensions"
	eselect gnome-shell-extensions update
	eend $?
}

pkg_postrm() {
	gnome2_schemas_update
}
