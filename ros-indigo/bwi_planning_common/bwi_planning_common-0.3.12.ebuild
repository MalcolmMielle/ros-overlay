# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Common data structures, messages and service defintions used for
    determinist"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/utexas-bwi-gbp/bwi_common-release/archive/release/indigo/bwi_planning_common/0.3.12-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/cv_bridge
    ros-indigo/rospy
    ros-indigo/qt_gui
    ros-indigo/bwi_tools
    ros-indigo/rqt_gui
    ros-indigo/bwi_mapper
    ros-indigo/rqt_gui_py
    ros-indigo/std_msgs
    ros-indigo/python_qt_binding
    ros-indigo/message_runtime
    media-libs/sdl-image
"
DEPEND="${RDEPEND}
    ros-indigo/message_generation
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
