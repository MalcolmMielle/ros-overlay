# Copyright 2018 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="This package provides simulated tactile sensors for the Schunk Dextrous\
  [...]"
HOMEPAGE="http://ros.org/wiki/schunk_simulated_tactile_sensors"
SRC_URI="https://github.com/ipa320/schunk_modular_robotics-release/archive/release/kinetic/${PN}/0.6.10-0.tar.gz -> ${PN}-kinetic-release-${PV}.tar.gz"

LICENSE="Apache-2.0"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-kinetic/gazebo_msgs
	ros-kinetic/rospy
	ros-kinetic/schunk_sdh
"
DEPEND="${RDEPEND}
	ros-kinetic/catkin
"

SLOT="0"
ROS_DISTRO="kinetic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
