# Document  $Id: Makefile.am,v 1.13 2007/01/28 15:54:13 dleidert Exp $
# Summary   Makefile for the chemical-mime-data project.
#
# Copyright (C) 2004-2007 by Daniel Leidert <daniel.leidert@wgdd.de>.
#
# This file is free software. The copyright owner gives unlimited
# permission to copy, distribute and modify it.

SUBDIRS = src xsl freedesktop.org gnome html_docs kde icons po

AUTOMAKE_OPTIONS = check-news dist-bzip2 1.7

EXTRA_DIST = \
	HACKING \
	intltool-extract.in \
	intltool-update.in \
	intltool-merge.in

DISTCLEANFILES = \
	chemical-mime-data.pc \
	intltool-extract \
	intltool-update \
	intltool-merge

MAINTAINERCLEANFILES = \
	aclocal.m4 \
	configure \
	config.guess \
	config.sub \
	install-sh \
	intltool-extract.in \
	intltool-merge.in \
	intltool-update.in \
	missing \
	mkinstalldirs \
	Makefile.in \
	@PACKAGE@-@VERSION@.tar.{gz,bz2} \
	@PACKAGE@-@VERSION@.tar.{gz,bz2}.md5

DISTCHECK_CONFIGURE_FLAGS = --disable-update-database --disable-nls


pkgconfigdir = $(datadir)/pkgconfig
pkgconfig_DATA = chemical-mime-data.pc


install-sfnet:
	@cd html_docs && $(MAKE) install-sfnet || exit 1

