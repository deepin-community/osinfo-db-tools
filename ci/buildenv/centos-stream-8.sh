# THIS FILE WAS AUTO-GENERATED
#
#  $ lcitool manifest ci/manifest.yml
#
# https://gitlab.com/libvirt/libvirt-ci

function install_buildenv() {
    dnf distro-sync -y
    dnf install 'dnf-command(config-manager)' -y
    dnf config-manager --set-enabled -y powertools
    dnf install -y centos-release-advanced-virtualization
    dnf install -y epel-release
    dnf install -y epel-next-release
    dnf install -y \
        ca-certificates \
        ccache \
        gcc \
        gettext \
        git \
        glib2-devel \
        glibc-langpack-en \
        json-glib-devel \
        libarchive-devel \
        libsoup-devel \
        libxml2-devel \
        libxslt-devel \
        make \
        meson \
        ninja-build \
        pkgconfig \
        python3 \
        python3-pytest \
        python3-requests \
        rpm-build
    rpm -qa | sort > /packages.txt
    mkdir -p /usr/libexec/ccache-wrappers
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
}

export CCACHE_WRAPPERSDIR="/usr/libexec/ccache-wrappers"
export LANG="en_US.UTF-8"
export MAKE="/usr/bin/make"
export NINJA="/usr/bin/ninja"
export PYTHON="/usr/bin/python3"
