# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit gnome2-utils

DESCRIPTION="The most popular clipboard manager for GNOME, with over 1M downloads"
HOMEPAGE="https://github.com/tuberry/desktop-lyric"
SRC_URI="https://github.com/tuberry/desktop-lyric/archive/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/desktop-lyric-${PV}"

LICENSE="gpl-3.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-libs/glib:2
	app-eselect/eselect-gnome-shell-extensions
	=gnome-base/gnome-shell-${PV%.*}*
"

extension_uuid="desktop-lyric@tuberry"

src_install() {
	einstalldocs
	rm -f README.md LICENSE.md || die
	insinto /usr/share/glib-2.0/schemas
	insinto /usr/share/gnome-shell/extensions/"${extension_uuid}"
	doins -r *
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
