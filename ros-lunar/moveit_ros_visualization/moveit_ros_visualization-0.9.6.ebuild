# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Components of MoveIt that offer visualization"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-gbp/moveit-release/archive/release/lunar/moveit_ros_visualization/0.9.6-1.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-lunar/geometric_shapes
    ros-lunar/roscpp
    ros-lunar/moveit_ros_robot_interaction
    ros-lunar/object_recognition_msgs
    ros-lunar/rospy
    ros-lunar/moveit_ros_planning_interface
    ros-lunar/rviz
    ros-lunar/moveit_ros_perception
    ros-lunar/interactive_markers
    ros-lunar/moveit_ros_warehouse
    ros-lunar/pluginlib
"
DEPEND="
    ros-lunar/geometric_shapes
    ros-lunar/roscpp
    ros-lunar/moveit_ros_robot_interaction
    ros-lunar/object_recognition_msgs
    ros-lunar/rospy
    ros-lunar/moveit_ros_planning_interface
    ros-lunar/rviz
    ros-lunar/moveit_ros_perception
    ros-lunar/interactive_markers
    ros-lunar/moveit_ros_warehouse
    ros-lunar/pluginlib
    dev-cpp/eigen
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
