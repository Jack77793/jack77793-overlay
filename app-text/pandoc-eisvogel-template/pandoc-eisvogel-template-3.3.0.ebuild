# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A pandoc LaTeX template to convert markdown files to PDF or LaTeX."
HOMEPAGE="https://github.com/Wandmalfarbe/pandoc-latex-template"
SRC_URI="https://github.com/Wandmalfarbe/pandoc-latex-template/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/pandoc-latex-template-${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="app-text/pandoc"
DEPEND="${RDEPEND}"

src_prepare() {
	default
	chmod +x tools/release.sh || die
}

src_compile() {
	./tools/release.sh || die
}

src_install() {
	insinto /usr/share/pandoc/data/templates

	dodir /usr/share/pandoc/data/templates
	doins "${S}/dist/eisvogel.latex"
	doins "${S}/dist/eisvogel.beamer"
}
