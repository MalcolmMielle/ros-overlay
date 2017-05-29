# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Utilities and tools developed for rocon, but usable beyond the boundaries
    of"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/yujinrobot-release/rocon_tools-release/archive/release/indigo/rocon_tools/0.1.23-1.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-indigo/rocon_python_wifi
    ros-indigo/rocon_master_info
    ros-indigo/rocon_console
    ros-indigo/rocon_ebnf
    ros-indigo/rocon_uri
    ros-indigo/rocon_semantic_version
    ros-indigo/rocon_python_comms
    ros-indigo/rocon_python_redis
    ros-indigo/rocon_launch
    ros-indigo/rocon_interactions
    ros-indigo/rocon_python_utils
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
