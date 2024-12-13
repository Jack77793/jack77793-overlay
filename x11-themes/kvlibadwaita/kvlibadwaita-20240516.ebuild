# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Libadwaita style theme for Kvantum. Based on Colloid-kde."
HOMEPAGE="https://github.com/GabePoel/KvLibadwaita"

COMMIT="87c1ef9f44ec48855fd09ddab041007277e30e37"
SRC_URI="https://github.com/GabePoel/KvLibadwaita/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/KvLibadwaita-${COMMIT}/src"

RDEPEND="
	x11-themes/kvantum
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	insinto "/usr/share/Kvantum"
	doins -r KvLibadwaita
}
