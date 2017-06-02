# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="visp_camera_calibration allows easy calibration of
     cameras using a customiz"
HOMEPAGE="http://wiki.ros.org/visp_camera_calibration"
SRC_URI="https://github.com/lagadic/vision_visp-release/archive/release/indigo/visp_camera_calibration/0.10.0-0.tar.gz -> ${P}-${PV}.tar.gz"

LICENSE="GPLv2"

KEYWORDS="x86 amd64 arm ~arm64"

RDEPEND="
    ros-indigo/camera_calibration_parsers
    ros-indigo/geometry_msgs
    ros-indigo/message_generation
    ros-indigo/message_runtime
    ros-indigo/roscpp
    ros-indigo/sensor_msgs
    ros-indigo/std_msgs
    ros-indigo/visp
    ros-indigo/visp_bridge
"
DEPEND="${RDEPEND}
    ros-indigo/catkin
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/indigo"

src_unpack() {
    default
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