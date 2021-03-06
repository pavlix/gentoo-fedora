# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{2_7,3_4} )

inherit fedora-pagure distutils-r1

DESCRIPTION="Utility for interacting with rpm+git packaging systems"

LICENSE="GPL-2 LGPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

COMMON_DEPEND="
	${PYTHON_DEPS}
	dev-python/git-python[${PYTHON_USEDEP}]
	dev-python/kitchen[${PYTHON_USEDEP}]
	dev-python/pycurl[${PYTHON_USEDEP}]
	dev-util/koji[${PYTHON_USEDEP}]
"
DEPEND="
	${COMMON_DEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"
RDEPEND="
	${COMMON_DEPEND}
	app-arch/rpm[${PYTHON_USEDEP}]
	dev-python/cccolutils[${PYTHON_USEDEP}]
	dev-python/osbs-client[${PYTHON_USEDEP}]
	net-misc/curl
	net-misc/openssh

"
