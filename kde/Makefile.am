# Document  $Id: Makefile.am,v 1.11 2007/01/28 15:54:14 dleidert Exp $
# Summary   Makefile for the chemical-mime-data project.
#
# Copyright (C) 2004-2007 by Daniel Leidert <daniel.leidert@wgdd.de>.
#
# This file is free software. The copyright owner gives unlimited
# permission to copy, distribute and modify it.

CLEANFILES = $(kdemime_DATA)

MAINTAINERCLEANFILES = Makefile.in


VPATH += $(top_builddir)/src $(top_srcdir)/xsl 


if BOOL_KDE_MIME
kdemimedir   = $(with_kde_mime)/chemical
kdemime_DATA = *.desktop
endif #BOOL_KDE_MIME


*.desktop : cmd_kde.xsl chemical-mime-database.xml
	$(XSLTPROC) $(XSLTPROC_FLAGS) $^

