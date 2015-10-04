# -Try to find NVIDIA CG library
#

# The following are set after configuration is done:
#  CG_FOUND
#  CG_INCLUDE_DIR
#  CG_LIBRARIES
#

MACRO(DBG_MSG _MSG)
#  MESSAGE(STATUS "${CMAKE_CURRENT_LIST_FILE}(${CMAKE_CURRENT_LIST_LINE}):\n${_MSG}")
ENDMACRO(DBG_MSG)

# Figure out all available major versions and use the latest or use the one specified as optional input
# Usual stuff to setup the library

FIND_PATH(CG_INCLUDE_DIR cg.h /usr/include/Cg)
FIND_LIBRARY(CG_BASE_LIBRARY Cg /usr/lib64)
FIND_LIBRARY(CG_OPENGL_LIBRARY CgGL /usr/lib64)

LIST(APPEND CG_LIBRARIES ${CG_BASE_LIBRARY})
LIST(APPEND CG_LIBRARIES ${CG_OPENGL_LIBRARY})

IF (CG_INCLUDE_DIR AND CG_LIBRARIES)
   SET(CG_FOUND TRUE)
ENDIF (CG_INCLUDE_DIR AND CG_LIBRARIES)

IF (CG_FOUND)
   IF (NOT CG_FIND_QUIETLY)
      MESSAGE(STATUS "Found CG")
   ENDIF (NOT CG_FIND_QUIETLY)
ELSE (CG_FOUND)
   IF (CG_FIND_REQUIRED)
      MESSAGE(FATAL_ERROR "Could not find CG")
   ENDIF (CG_FIND_REQUIRED)
ENDIF (CG_FOUND)
