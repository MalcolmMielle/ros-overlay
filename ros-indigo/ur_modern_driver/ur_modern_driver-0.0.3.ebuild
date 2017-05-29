# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="The new driver for the UR3/UR5/UR10 robot arms from universal robots"
HOMEPAGE="http://wiki.ros.org/ur_modern_driver"
SRC_URI="https://github.com/clearpath-gbp/ur_modern_driver-release/archive/release/indigo/ur_modern_driver/0.0.3-0.tar.gz"

LICENSE="Beerware"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/control_msgs
    ros-indigo/ros_controllers
    ros-indigo/trajectory_msgs
    ros-indigo/ur_description
    ros-indigo/geometry_msgs
    ros-indigo/hardware_interface
    ros-indigo/sensor_msgs
    ros-indigo/controller_manager
    ros-indigo/roscpp
    ros-indigo/std_msgs
    ros-indigo/tf
    ros-indigo/ur_msgs
    ros-indigo/actionlib
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
