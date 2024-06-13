# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit xdg

DESCRIPTION="A companion icon theme for Gnome Shell's Adwaita."
HOMEPAGE="https://github.com/somepaulo/MoreWaita"
SRC_URI="https://github.com/somepaulo/MoreWaita/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm64 ppc64 x86"
S="${WORKDIR}/MoreWaita-${PV}"

src_compile() { :; }
