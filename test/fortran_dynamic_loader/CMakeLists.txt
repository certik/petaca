project(FortranDynamicLoaderTest)

include(CTest)

# Want test modules in the build directory.
unset(CMAKE_Fortran_MODULE_DIRECTORY)

# Add the library module directory to the module search path.
include_directories(${Petaca_MODULE_DIR})
include_directories(${Petaca_INCLUDE_DIR})

add_executable (test_fortran_dynamic_loader test_fortran_dynamic_loader.F90)
target_link_libraries(test_fortran_dynamic_loader petaca)
add_test(fortran_dynamic_loader test_fortran_dynamic_loader)

# Shared library loaded by the test.
add_library(mylib SHARED mylib.F90)
