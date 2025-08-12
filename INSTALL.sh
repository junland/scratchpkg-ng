#!/bin/sh

BINDIR=/usr/bin
CONFDIR=/etc
CACHE_DIR=/var/cache/scratchpkg
PORT_DIR=/usr/ports
REVDEPD=/etc/revdep.d
REVDEPCONF=/etc/revdep.conf

install -dv ${DESTDIR}${BINDIR}
install -dv ${DESTDIR}${CONFDIR}
install -dv ${DESTDIR}${PORT_DIR}
install -dv ${DESTDIR}${REVDEPD}

install -dvm777 ${DESTDIR}${CACHE_DIR}/packages
install -dvm777 ${DESTDIR}${CACHE_DIR}/sources
install -dvm777 ${DESTDIR}${CACHE_DIR}/work

install -vm755 pkgadd pkgbase pkgbuild pkgdel pkgdepends pkgrebuild ${DESTDIR}${BINDIR}

install -vm755 portcreate portsync revdep scratch updateconf xchroot ${DESTDIR}${BINDIR}

install -vm644 scratchpkg.alias scratchpkg.conf scratchpkg.mask scratchpkg.repo ${DESTDIR}${CONFDIR}

install -vm644 revdep.conf ${DESTDIR}${REVDEPCONF}
