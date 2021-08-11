# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7


inherit desktop xdg-utils

DESCRIPTION="The Redream Sega Dreamcast emulator, distributed in binary format."

HOMEPAGE="https://redream.io/"

SRC_URI="https://redream.io/download/${PN}.x86_64-linux-v${PV}.tar.gz"

RESTRICT="mirror strip bindist"

LICENSE="no-source-code"

SLOT="0"

KEYWORDS="-* ~amd64"

IUSE="X sdl2"

S="${WORKDIR}"

RDEPEND="
	>=media-libs/libsdl2-2.0.14-r1 
	virtual/opengl"

DEPEND="${RDEPEND}"

QA_PRESTRIPPED="*"
QA_PREBUILT="opt/${PN}/redream"

src_install(){
	mkdir -p "${ED%/}/opt/${PN}"
	mv "redream" "${ED%/}/opt/${PN}" 
	cd "${ED%/}/opt/${PN}/"
	domenu "${FILESDIR}/${PN}.desktop"
	newicon "${FILESDIR}/${PN}.png" ${PN}.png
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}

