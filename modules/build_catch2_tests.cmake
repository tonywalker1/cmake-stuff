#
# MIT License
#
# Copyright (c) 2021  Tony Walker
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

#
# Turns a CMakeLists.txt for a Catch2 unit test into a one-liner (+/- formatting).
#
# For example:
#     build_catch2_tests(TEST something_test
#                        SRC  main.cpp test_src1.cpp test_src2.cpp
#                        LIBS mylib yourlib)
#
function(build_catch2_tests)

    set(oneValueArgs TEST)
    set(multiValueArgs SRC LIBS)
    cmake_parse_arguments("" "" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    find_package(Catch2 REQUIRED)

    add_executable(${_TEST} ${_SRC})
    target_link_libraries(${_TEST} Catch2::Catch2 ${_LIBS})

    include(CTest)
    include(Catch)
    catch_discover_tests(${_TEST})
    
endfunction()
