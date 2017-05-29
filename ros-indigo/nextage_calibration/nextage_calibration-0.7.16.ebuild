# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="This package provides .launch files and other tools for
  calibrating the head-m"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/tork-a/rtmros_nextage-release/archive/release/indigo/nextage_calibration/0.7.16-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/turtlebot_description
    ros-indigo/urdf
    ros-indigo/openni2_launch
    ros-indigo/checkerboard_detector
    ros-indigo/gazebo_ros
    ros-indigo/freenect_stack
    ros-indigo/joint_state_publisher
    ros-indigo/dynamic_tf_publisher
    ros-indigo/robot_state_publisher
    ros-indigo/gazebo_plugins
    ros-indigo/tf
"
DEPEND="${RDEPEND}
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
