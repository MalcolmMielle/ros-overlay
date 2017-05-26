# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="ROS console output library."
HOMEPAGE="http://www.ros.org/wiki/rosconsole"
SRC_URI="https://github.com/ros-gbp/ros_comm-release/archive/release/lunar/rosconsole/1.13.0-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-lunar/rosbuild
    ros-lunar/rostime
    ros-lunar/cpp_common
    dev-libs/log4cxx
    dev-libs/apr
"
DEPEND="
    ros-lunar/rostime
    ros-lunar/rosunit
    ros-lunar/cpp_common
    dev-libs/boost
    dev-libs/apr
    dev-libs/log4cxx
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo

src_unpack() {
    wget -O ${P}.tar.gz ${SRC_URI}
    tar -xf ${P}.tar.gz
    rm -f ${P}.tar.gz
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
    echo ""
}

pkg_postinst() {
    cd ../work
    source /opt/ros/lunar/setup.bash
    catkin_make_isolated --install --install-space="/opt/ros/lunar" || die
}
