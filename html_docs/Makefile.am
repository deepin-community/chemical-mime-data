# Document  $Id: Makefile.am,v 1.8 2007/02/04 23:12:42 dleidert Exp $
# Summary   Makefile for the chemical-mime-data project.
#
# Copyright (C) 2007 by Daniel Leidert <daniel.leidert@wgdd.de>.
#
# This file is free software. The copyright owner gives unlimited
# permission to copy, distribute and modify it.

CLEANFILES = chemical-mime-data.html

MAINTAINERCLEANFILES = Makefile.in

VPATH += $(top_builddir)/src $(top_builddir)/xsl $(top_srcdir)/xsl

XSLTPROC_FLAGS += --path "$(VPATH)"


html_DATA = chemical-mime-data.html
dist_html_DATA = index.html cmd.css


chemical-mime-data.html : cmd_website.xsl chemical-mime-database.xml
	$(XSLTPROC) $(XSLTPROC_FLAGS) $^

install-sfnet: $(html_DATA) $(dist_html_DATA)
	@echo "******************************************************************************"
	@echo "* Copying the HTML files to sf.net."
	@echo "* Make sure to have an entry for 'sf.net' in your ${HOME}/.ssh/config."
	@echo "******************************************************************************"
	scp $^ sf.net:/home/groups/c/ch/chemical-mime/htdocs

