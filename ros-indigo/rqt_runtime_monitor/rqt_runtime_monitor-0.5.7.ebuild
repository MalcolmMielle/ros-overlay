# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="rqt_runtime_monitor provides a GUI plugin viewing DiagnosticsArray messages"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-gbp/rqt_runtime_monitor-release/archive/release/indigo/rqt_runtime_monitor/0.5.7-0.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-indigo/diagnostic_msgs
	ros-indigo/python_qt_binding
	ros-indigo/qt_gui
	ros-indigo/rospy
	ros-indigo/rqt_gui
	ros-indigo/rqt_gui_py
	dev-python/rospkg
"
DEPEND="${RDEPEND}
	ros-indigo/catkin
"

SLOT="0"
ROS_DISTRO="indigo"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

