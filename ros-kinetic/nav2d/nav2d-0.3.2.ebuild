# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Meta-Package containing modules for 2D-Navigation"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/skasperski/navigation_2d-release/archive/release/kinetic/nav2d/0.3.2-0.tar.gz -> ${P}-${PV}.tar.gz"

LICENSE="GPLv3"

KEYWORDS="x86 amd64 arm ~arm64"

RDEPEND="
    ros-kinetic/nav2d_exploration
    ros-kinetic/nav2d_karto
    ros-kinetic/nav2d_localizer
    ros-kinetic/nav2d_msgs
    ros-kinetic/nav2d_navigator
    ros-kinetic/nav2d_operator
    ros-kinetic/nav2d_remote
    ros-kinetic/nav2d_tutorials
"
DEPEND="${RDEPEND}
    ros-kinetic/catkin
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/kinetic"

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