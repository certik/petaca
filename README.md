Petaca
======
Petaca is an ad hoc collection of modern Fortran modules that provide
broadly useful capabilities -- things that I have found myself using
repeatedly across many projects. A unifying feature of the modules is
their object-oriented interfaces and implementation.

Read the documentation on [readthedocs.org](http://petaca.readthedocs.io/)
(under development).

The compilers currently supported/tested are:
* NAG nagfor 7.0, 7.1, and 7.2 (recent builds of those versions)
* GNU gfortran 12, 13, 14, and 15
* Intel ifx OneAPI 2024, 2025; also classic ifort from OneAPI
* LLVM flang versions 19.1 and 20.1

Other compilers supporting the Fortran 2018 standard should work as well.

Building with Pixi
-------------------
[Pixi](https://pixi.sh) can manage the build dependencies (CMake, YAJL) from
conda-forge. You need the Fortran compiler (`flang` or `lfortran`) already
available in your PATH.

Two pixi environments are provided — `flang` and `lfortran`. Each builds
into its own directory (`build-flang` / `build-lfortran`) so they can
coexist:

```sh
pixi run -e flang test       # build and test with flang
pixi run -e lfortran test    # build and test with lfortran
```

The individual steps can also be run separately:

```sh
pixi run -e flang configure  # run CMake configure
pixi run -e flang build      # compile
pixi run -e flang test       # run CTest
```

On macOS, `flang` does not recognise the Apple-specific linker flags
(`-dynamiclib`, `-install_name`) that CMake emits by default, so the
configure step uses `cmake/FlangFortranOverride.cmake` to replace them
with the portable `-shared` flag. The main library is built as a static
archive (`-DBUILD_SHARED_LIBS=OFF`).

**Note:** The `timer_tree` test may fail with flang because `cpu_time`
currently returns 0, causing a divide-by-zero in the test. All other
tests pass.

