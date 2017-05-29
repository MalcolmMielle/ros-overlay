# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="RealSense Camera package allowing access to Intel 3D cameras and advanced module"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/intel-ros/realsense-release/archive/release/indigo/realsense_camera/1.8.0-0.tar.gz"

LICENSE="BSD 3-clause. See license attached"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/cv_bridge
    ros-indigo/rostest
    ros-indigo/camera_info_manager
    ros-indigo/dynamic_reconfigure
    ros-indigo/std_msgs
    ros-indigo/message_generation
    ros-indigo/rgbd_launch
    ros-indigo/roscpp
    ros-indigo/nodelet
    ros-indigo/sensor_msgs
    ros-indigo/pcl_ros
    ros-indigo/image_transport
    ros-indigo/librealsense
    ros-indigo/tf
    ros-indigo/message_runtime
    dev-libs/boost
"
DEPEND="${RDEPEND}
    ros-indigo/roslint
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
