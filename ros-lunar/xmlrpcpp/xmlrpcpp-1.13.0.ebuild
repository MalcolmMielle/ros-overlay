# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="XmlRpc++ is a C++ implementation of the XML-RPC protocol. This version is
    he"
HOMEPAGE="http://xmlrpcpp.sourceforge.net"
SRC_URI="https://github.com/ros-gbp/ros_comm-release/archive/release/lunar/xmlrpcpp/1.13.0-0.tar.gz -> ${P}-${PV}.tar.gz"

LICENSE="LGPL-2.1"

KEYWORDS="x86 amd64 arm ~arm64"

RDEPEND="
    ros-lunar/cpp_common
"
DEPEND="${RDEPEND}
    ros-lunar/catkin
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/lunar"

src_unpack() {
    default
    mv *${P}* ${P}
}

src_configure() {
    mkdir ${WORKDIR}/src
    cp -R ${WORKDIR}/${P} ${WORKDIR}/src/${P}
}

src_compile() {
    echo ""
}

src_install() {
    cd ../../work
    source /${ROS_PREFIX}/setup.bash
    catkin_make_isolated --install --install-space="${D}/${ROS_PREFIX}" || die
    if [[ -e /${ROS_PREFIX}/setup.bash ]]; then
        rm -f ${D}/${ROS_PREFIX}/{.catkin,_setup_util.py,env.sh,setup.bash,setup.sh}
        rm -f ${D}/${ROS_PREFIX}/{setup.zsh,.rosinstall}
    fi
}