build_build_essential_clang() {
    PKG=build-essential-clang
    PKG_VERSION=1.0
    PKG_DESC="Informational list of clang build-essential packages"
    PKG_DEPS="busybox binutils clang libgcc-dev cxxstl make ndk-misc ndk-sysroot-\${HOSTARCH}-\${HOSTNDKVERSION} cctools-examples"
    c_tag ${PKG} && return

    banner "Build clang build essential"

    mkdir -p ${TMPINST_DIR}/${PKG}/cctools

    local filename="${PKG}_${PKG_VERSION}_all.zip"
    build_package_desc ${TMPINST_DIR}/${PKG} $filename ${PKG} $PKG_VERSION $PKG_ARCH "$PKG_DESC" "$PKG_DEPS"
    cd ${TMPINST_DIR}/${PKG}
    zip -r9y ../$filename cctools pkgdesc

    s_tag ${PKG}
}
