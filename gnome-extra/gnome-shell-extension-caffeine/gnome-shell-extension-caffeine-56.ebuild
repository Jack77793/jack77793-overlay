# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit gnome2-utils

EXTENSION_VERSION="65"

DESCRIPTION="Disable screensaver and auto suspend"
HOMEPAGE="https://github.com/eonpatapon/gnome-shell-extension-caffeine"
SRC_URI="https://github.com/eonpatapon/gnome-shell-extension-caffeine/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-libs/glib:2
	app-eselect/eselect-gnome-shell-extensions
	>=gnome-base/gnome-shell-45
"

extension_uuid="caffeine@patapon.info"

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
