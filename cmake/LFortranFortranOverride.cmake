# Override for LFortran on macOS.
# LFortran does not recognize the macOS-specific linker driver flags
# (-dynamiclib, -install_name) that CMake's Apple platform module
# normally uses, so replace them with the portable --shared flag.
set(CMAKE_SHARED_LIBRARY_CREATE_Fortran_FLAGS "--shared")
set(CMAKE_SHARED_LIBRARY_SONAME_Fortran_FLAG "")
set(CMAKE_Fortran_CREATE_SHARED_LIBRARY
  "<CMAKE_Fortran_COMPILER> <CMAKE_SHARED_LIBRARY_CREATE_Fortran_FLAGS> <LANGUAGE_COMPILE_FLAGS> <LINK_FLAGS> -o <TARGET> <OBJECTS> <LINK_LIBRARIES>")
