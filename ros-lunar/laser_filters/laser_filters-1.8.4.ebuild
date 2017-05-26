# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Assorted filters designed to operate on 2D planar laser scanners,
    which use the sensor_msgs/LaserScan type."
HOMEPAGE="http://ros.org/wiki/laser_filters"
SRC_URI="https://github.com/ros-gbp/laser_filters-release/archive/release/lunar/laser_filters/1.8.4-1.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-lunar/filters
    ros-lunar/message_filters
    ros-lunar/roscpp
    ros-lunar/laser_geometry
    ros-lunar/sensor_msgs
    ros-lunar/angles
    ros-lunar/pluginlib
    ros-lunar/tf
"
DEPEND="
    ros-lunar/filters
    ros-lunar/message_filters
    ros-lunar/roscpp
    ros-lunar/laser_geometry
    ros-lunar/sensor_msgs
    ros-lunar/rostest
    ros-lunar/angles
    ros-lunar/pluginlib
    ros-lunar/tf
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
