# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7


DESCRIPTION="The Redream Sega Dreamcast emulator, distributed in binary format."

HOMEPAGE="https://redream.io/"

SRC_URI="https://redream.io/${PN}.x86_64-linux-v${PV}.tar.gz"

RESTRICT="mirror strip bindist"

LICENSE="no-source-code"

SLOT="0"

KEYWORDS="-* ~amd64"

IUSE="X sdl2"

RDEPEND="
	>=media-libs/libsdl2-2.0.14-r1 
	virtual/opengl"

DEPEND="${RDEPEND}"

QA_PRESTRIPPED="*"
QA_PREBUILT="opt/${PN}/redream"

src_unpack() {
	:
}

src_install(){
	mkdir -p "${ED%/}/opt/${PN}"
	cd "${ED%/}/opt/${PN}/"
	unpack ${A}
	cd "${FILESDIR}"
	domenu "${PN}.desktop"
	newicon "redream.png" ${PN}.png
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}

