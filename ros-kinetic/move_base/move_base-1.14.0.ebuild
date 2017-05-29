# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION=""
HOMEPAGE="http://wiki.ros.org/move_base"
SRC_URI="https://github.com/ros-gbp/navigation-release/archive/release/kinetic/move_base/1.14.0-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/rotate_recovery
    ros-kinetic/navfn
    ros-kinetic/rospy
    ros-kinetic/pluginlib
    ros-kinetic/visualization_msgs
    ros-kinetic/std_srvs
    ros-kinetic/dynamic_reconfigure
    ros-kinetic/nav_msgs
    ros-kinetic/nav_core
    ros-kinetic/base_local_planner
    ros-kinetic/geometry_msgs
    ros-kinetic/move_base_msgs
    ros-kinetic/std_msgs
    ros-kinetic/tf
    ros-kinetic/roscpp
    ros-kinetic/costmap_2d
    ros-kinetic/message_runtime
    ros-kinetic/actionlib
    ros-kinetic/clear_costmap_recovery
"
DEPEND="${RDEPEND}
    ros-kinetic/cmake_modules
    ros-kinetic/message_generation
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
