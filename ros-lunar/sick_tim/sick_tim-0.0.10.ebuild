# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="A ROS driver for the SICK TiM series of laser scanners."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/uos-gbp/sick_tim-release/archive/release/lunar/sick_tim/0.0.10-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-lunar/sensor_msgs
    ros-lunar/roscpp
    ros-lunar/dynamic_reconfigure
    ros-lunar/diagnostic_updater
    =dev-libs/libusb-1.0*
"
DEPEND="
    ros-lunar/sensor_msgs
    ros-lunar/roscpp
    ros-lunar/dynamic_reconfigure
    ros-lunar/diagnostic_updater
    =dev-libs/libusb-1.0*
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
