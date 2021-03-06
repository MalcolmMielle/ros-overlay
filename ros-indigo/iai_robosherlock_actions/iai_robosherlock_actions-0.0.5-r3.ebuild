# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="Action interfaces to trigger perception via the Robosherlock	perception syst"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/code-iai-release/iai_common_msgs-release/archive/release/indigo/iai_robosherlock_actions/0.0.5-3.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-indigo/actionlib_msgs
	ros-indigo/designator_integration_msgs
	ros-indigo/geometry_msgs
	ros-indigo/message_runtime
	ros-indigo/shape_msgs
"
DEPEND="${RDEPEND}
	ros-indigo/catkin
	ros-indigo/message_generation
"

SLOT="0"
ROS_DISTRO="indigo"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

