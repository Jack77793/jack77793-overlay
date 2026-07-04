# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8


inherit meson vala xdg

DESCRIPTION="PipeWire graph GTK4/Libadwaita GUI."

HOMEPAGE="https://github.com/dp0sk/Crosspipe"

SRC_URI="https://github.com/dp0sk/Crosspipe/archive/${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/Crosspipe-${PV}"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=gui-libs/gtk-4.10
	>=gui-libs/libadwaita-1.4
	dev-libs/libgee
	media-video/pipewire
"
DEPEND="${RDEPEND}"

src_prepare() {
	vala_setup
	default
}
