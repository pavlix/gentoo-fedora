# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_4} )

inherit fedora-pagure python-r1 eutils

DESCRIPTION="Build system for the Fedora project"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="+minimal +forked"

DEPEND="
"
RDEPEND="
	app-arch/rpm
	dev-python/pyopenssl
	dev-python/python-krbV
	dev-python/urlgrabber
	sys-apps/yum
"

src_unpack() {
	use forked && EGIT_REPO_URI="https://pagure.io/forks/pavlix/${PN}.git"

	git-r3_src_unpack
}

src_prepare() {
	cp "${FILESDIR}"/koji.conf.fedora cli/koji.conf
}

src_install() {
	mkdir ${D}/etc

	if use minimal ; then
		python_foreach_impl emake -j1 -C koji install DESTDIR="${D}" || die
		emake -j1 -C cli install DESTDIR="${D}" || die
	else
		emake -j1 install DESTDIR="${D}" || die
	fi
}
