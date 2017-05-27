cd sr	AC_PREREQ(2.59)
AC_INIT([GNU Smalltalk package Nettle], [0.0], , gst-nettle)
AC_CONFIG_SRCDIR([src/package.xml])

AM_INIT_AUTOMAKE

AM_PATH_GST([2.95c], , [AC_MSG_ERROR([GNU Smalltalk not found])])
GST_PACKAGE_ENABLE([Nettle], [src])

AC_CONFIG_FILES([Makefile])
AC_CONFIG_FILES([gst], [chmod +x gst])
AC_OUTPUT
