# Copied and substituted from
#   <CSaruEnvironRoot>/cmake/BaseLibConfig.cmake.in
#
# This is a starter Config.cmake file for your library.  Your library
#	itself doesn't use it, but it gets install()ed in your library's
#	output directory by your libarary's CMakeLists.txt when you
#	"cmake ." there.  This allows other CMake projects to use
#	find_package() to locate your library (if it's in their
#	CMAKE_PREFIX_PATH), and from there get the appropriate includes and
#	libs setup.  See <CSaruEnvironRoot>/cmake/CSaru.cmake to see how
#	this file is generated (look for the CSaru_Lib() macro), and how
#	other CSaruEnviron projects find your package via the
#	CMAKE_PREFIX_PATH.
#
# This is only written if you're building a static library and don't
#	already have a package Config.cmake file, so feel free to modify it
#	in your lib directory if you need to do fancier stuff.  It won't get
#	overwritten.

# Other CMake projects getting here via find_package() will add your
#	library's output's headers' directory to their list of additional
#	include directories.
#
# CMAKE_CURRENT_LIST_DIR holds the path to this file when find_package()
#	finds it.  Go up to the main dir of this pkg, then up one more,
#	to allow easy, disambiguous includes like "csaru-json-cpp/Parser.h".
#	The more Go-like way would be "github.com/akaito/csaru-json-cpp/Parser.h".
#	Since we're not doing anything smart with those extra characters yet
#	(like Go's auto-detection of dependencies), save all that extra typing for
#	the future when we *might* do something like that, instead of paying for
#	it now.
include_directories("${CMAKE_CURRENT_LIST_DIR}/../..")
# TODO : Include a -targets CMake file to provide targets, to
#        replace file globbing below?
#include("${CMAKE_CURRENT_LIST_DIR}/../

# This is similar to the include_directories above, except for linking
#	to libraries.  This file provides a variable,
#	csaru-uuid-cpp_LIBRARIES, to any other CMake project that finds this
#	one via find_package().  That project can then use
#	target_link_libraries() with csaru-uuid-cpp_LIBRARIES to make its
#	linker aware of this project's compiled libraries.
if (WIN32)
    file(GLOB_RECURSE csaru-uuid-cpp_LIBRARIES "${CMAKE_CURRENT_LIST_DIR}/../static/*.lib")
else()
    file(GLOB_RECURSE csaru-uuid-cpp_LIBRARIES "${CMAKE_CURRENT_LIST_DIR}/../static/*.a")
endif()

