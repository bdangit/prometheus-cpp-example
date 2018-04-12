pkg_name=prometheus-cpp-example
pkg_origin=bdangit
pkg_version=0.1.0
pkg_license=('MIT')
pkg_build_deps=(
  core/gcc
  core/cmake
  core/make
  core/pkg-config
  core/prometheus-cpp
)
pkg_deps=(
  core/glibc
  core/gcc-libs
  core/zlib
  core/protobuf
)

pkg_bin_dirs=(bin)

BUILDDIR='build'

do_prepare() {
  rm -rf "${BUILDDIR}"
}

do_build() {
  mkdir -p "${BUILDDIR}"
  cmake -H./ \
    -B${BUILDDIR} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
    -Dprometheus-cpp_DIR="$(pkg_path_for core/prometheus-cpp)/lib64/cmake/prometheus-cpp"
  make -C "${BUILDDIR}" VERBOSE=${DEBUG}
}

do_install() {
  make -C "${BUILDDIR}" install
}
