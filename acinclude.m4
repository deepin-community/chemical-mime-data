dnl Document  $Id: acinclude.m4,v 1.2 2006/05/02 22:20:12 dleidert Exp $
dnl Summary   Custom macros for the configure script.
dnl
dnl Copyright (C) 2006 by Daniel Leidert.
dnl
dnl Copying and distribution of this file, with or without modification,
dnl are permitted in any medium without royalty provided the copyright
dnl notice and this notice are preserved.


dnl @synopsis MP_PROG_XMLLINT
dnl
dnl @summary Determine if we can use the xmllint program
dnl
dnl This is a simple macro to define the location of xmllint (which can
dnl be overridden by the user) and special options to use.
dnl
dnl @category InstalledPackages
dnl @author Daniel Leidert <daniel.leidert@wgdd.de>
dnl @version 2006-03-10
dnl @license AllPermissive
AC_DEFUN([MP_PROG_XMLLINT],[
AC_ARG_VAR(
	[XMLLINT],
	[The 'xmllint' binary with path. Use it to define or override the location of 'xmllint'.]
)
AC_PATH_PROG([XMLLINT], [xmllint])
if test -z $XMLLINT ; then
	AC_MSG_WARN(['xmllint' was not found. We cannot validate the XML sources. See README.]) ;
fi
AC_SUBST([XMLLINT])
AM_CONDITIONAL([HAVE_XMLLINT], [test "x$XMLLINT" != "x"])

AC_ARG_VAR(
	[XMLLINT_FLAGS],
	[More options, which should be used along with 'xmllint', like e.g. '--nonet'.]
)
AC_SUBST([XMLLINT_FLAGS])
echo -n "checking for optional xmllint options to use... "
echo $XMLLINT_FLAGS
]) # MP_PROG_XMLLINT


dnl @synopsis MP_PROG_XSLTPROC
dnl
dnl @summary Determine if we can use the xsltproc program
dnl
dnl This is a simple macro to define the location of xsltproc (which can
dnl be overridden by the user) and special options to use.
dnl
dnl @category InstalledPackages
dnl @author Daniel Leidert <daniel.leidert@wgdd.de>
dnl @version 2006-03-10
dnl @license AllPermissive
AC_DEFUN([MP_PROG_XSLTPROC],[
AC_ARG_VAR(
	[XSLTPROC],
	[The 'xsltproc' binary with path. Use it to define or override the location of 'xsltproc'.]
)
AC_PATH_PROG([XSLTPROC], [xsltproc])
if test -z $XSLTPROC ; then
	AC_MSG_ERROR(['xsltproc' was not found! We cannot proceed. See README.]) ;
fi
AC_SUBST([XSLTPROC])

AC_ARG_VAR(
	[XSLTPROC_FLAGS],
	[More options, which should be used along with 'xsltproc', like e.g. '--nonet'.]
)
AC_SUBST([XSLTPROC_FLAGS])
echo -n "checking for optional xsltproc options to use... "
echo $XSLTPROC_FLAGS
]) # MP_PROG_XSLTPROC

