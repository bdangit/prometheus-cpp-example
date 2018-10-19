pkg_name=prometheus-cpp-example
pkg_origin=bdangit
pkg_version=0.1.1
pkg_license=('MIT')
pkg_build_deps=(
  core/gcc
  core/cmake
  core/make
  core/pkg-config
  bdangit/prometheus-cpp
)
pkg_deps=(
  core/glibc
  core/gcc-libs
  core/zlib
  core/protobuf
)

pkg_bin_dirs=(bin)

do_begin() {
  export HAB_ENV_CMAKE_FIND_ROOT_PATH_SEPARATOR=";"
  export HAB_ENV_CMAKE_FIND_ROOT_PATH_TYPE="aggregate"
}

do_setup_environment() {
  set_buildtime_env BUILDDIR "_build"
}

do_prepare() {
  mkdir -p "${BUILDDIR}"
}

do_build() {
  pushd "${BUILDDIR}" || exit 1
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
    -DCMAKE_FIND_ROOT_PATH="${CMAKE_FIND_ROOT_PATH}" \
    ..
  make
  popd || exit 1
}

do_install() {
  pushd "${BUILDDIR}" || exit 1
  make install
  popd || exit 1
}
