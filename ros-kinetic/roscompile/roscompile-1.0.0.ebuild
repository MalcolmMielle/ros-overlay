# Copyright 2018 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="The roscompile package"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/wu-robotics/${PN}-release/archive/release/kinetic/${PN}/1.0.0-0.tar.gz -> ${PN}-kinetic-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
IUSE="test"
RDEPEND="
	ros-kinetic/catkin
	ros-kinetic/resource_retriever
	ros-kinetic/ros_introspection
	test? ( ros-kinetic/roslint )
"
DEPEND="${RDEPEND}
"

SLOT="0"
ROS_DISTRO="kinetic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
