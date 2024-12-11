# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="Sarasa Term SC with Nerd Font patches"

HOMEPAGE="https://github.com/be5invis/Sarasa-Gothic"

NERD_VERSION="3.3.0"
SRC_URI="
	https://github.com/be5invis/Sarasa-Gothic/releases/download/v${PV}/Sarasa-TTF-${PV}.7z -> ${P}.7z
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${NERD_VERSION}/FontPatcher.zip
"

LICENSE="OFL-1.1 MIT"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	app-arch/p7zip
	app-arch/unzip
	media-gfx/fontforge[python]
"

src_unpack() {
	mkdir -p "${WORKDIR}/${P}" || die
	mkdir -p "${WORKDIR}/FontPatcher" || die
	7z x -o"${WORKDIR}/${P}" "${DISTDIR}/${P}.7z" || die
	unzip -d "${WORKDIR}/FontPatcher" "${DISTDIR}/FontPatcher.zip" || die
	mkdir -p "${WORKDIR}/FontPatcher/out" || die
}

src_compile() {
	for f in ${WORKDIR}/${P}/SarasaTermSC-*.ttf; do
		fontforge -script "${WORKDIR}/FontPatcher/font-patcher" -c -out "${WORKDIR}/FontPatcher/out" "${f}"
	done
}

S="${WORKDIR}/FontPatcher/out"
FONT_S="${S}"
FONT_SUFFIX="ttf"
