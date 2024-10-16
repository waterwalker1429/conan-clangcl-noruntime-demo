
AC_INIT([mypkg], [0.1], [])
AM_INIT_AUTOMAKE([-Wall -Werror foreign])
AC_PROG_CXX
AM_PROG_AR
LT_INIT
AC_CHECK_LIB([dependency], [dependency], [], [AC_MSG_ERROR([dependency library not found.])])
AC_CHECK_HEADER([dependency.h], [], [AC_MSG_ERROR([dependency.h header not found.])])
AC_CONFIG_FILES([Makefile src/Makefile])
AC_OUTPUT
