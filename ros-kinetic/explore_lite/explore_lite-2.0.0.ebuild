# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Lightweight frontier-based exploration."
HOMEPAGE="http://wiki.ros.org/explore_lite"
SRC_URI="https://github.com/hrnr/m-explore-release/archive/release/kinetic/explore_lite/2.0.0-1.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/visualization_msgs
    ros-kinetic/map_msgs
    ros-kinetic/navfn
    ros-kinetic/actionlib
    ros-kinetic/nav_msgs
    ros-kinetic/actionlib_msgs
    ros-kinetic/geometry_msgs
    ros-kinetic/std_msgs
    ros-kinetic/move_base_msgs
    ros-kinetic/roscpp
    ros-kinetic/costmap_2d
    ros-kinetic/tf
"
DEPEND="${RDEPEND}
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/kinetic"

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
    cd ../../work
    source /${ROS_PREFIX}/setup.bash
    catkin_make_isolated --install --install-space="${D}/${ROS_PREFIX}" || die
    if [[ -e /${ROS_PREFIX}/setup.bash ]]; then
        rm -f ${D}/${ROS_PREFIX}/{.catkin,_setup_util.py,env.sh,setup.bash,setup.sh}
        rm -f ${D}/${ROS_PREFIX}/{setup.zsh,.rosinstall}
    fi
}
