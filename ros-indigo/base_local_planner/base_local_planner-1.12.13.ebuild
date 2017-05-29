# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION=""
HOMEPAGE="http://wiki.ros.org/base_local_planner"
SRC_URI="https://github.com/ros-gbp/navigation-release/archive/release/indigo/base_local_planner/1.12.13-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/rosconsole
    ros-indigo/visualization_msgs
    ros-indigo/rospy
    ros-indigo/pluginlib
    ros-indigo/nav_msgs
    ros-indigo/dynamic_reconfigure
    ros-indigo/voxel_grid
    ros-indigo/nav_core
    ros-indigo/geometry_msgs
    ros-indigo/std_msgs
    ros-indigo/pcl_ros
    ros-indigo/roscpp
    ros-indigo/costmap_2d
    ros-indigo/message_generation
    ros-indigo/tf
    ros-indigo/angles
    dev-cpp/eigen
"
DEPEND="${RDEPEND}
    ros-indigo/cmake_modules
    ros-indigo/pcl_conversions
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/indigo"

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
