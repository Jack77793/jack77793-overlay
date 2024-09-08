# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit gnome2-utils meson

DESCRIPTION="The most popular clipboard manager for GNOME, with over 1M downloads"
HOMEPAGE="https://github.com/tuberry/desktop-lyric"
SRC_URI="https://github.com/tuberry/desktop-lyric/archive/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/desktop-lyric-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	app-eselect/eselect-gnome-shell-extensions
	=gnome-base/gnome-shell-${PV%.*}*
"

extension_uuid="desktop-lyric@tuberry"

src_prepare() {
	default
	echo -e "#!/usr/bin/env bash\necho \"45.0\"" > ${S}/cli/get-version.sh
}

src_install() {
	einstalldocs
	rm -f README.md LICENSE || die
	insinto /usr/share/glib-2.0/schemas
	insinto /usr/share/gnome-shell/extensions/"${extension_uuid}"
	rm -rf schemas
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
