# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Materia theme for Kvantum"
HOMEPAGE="https://github.com/PapirusDevelopmentTeam/materia-kde"

SRC_URI="https://github.com/PapirusDevelopmentTeam/materia-kde/archive/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/materia-kde-${PV}/Kvantum"

RDEPEND="
	x11-themes/kvantum
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	insinto "/usr/share/Kvantum"
	doins -r Materia
	doins -r MateriaDark
	doins -r MateriaLight
}
