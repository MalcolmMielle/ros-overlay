# Copyright 2018 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="The cob_common stack hosts common packages that are used within the Care-O-[...]"
HOMEPAGE="http://ros.org/wiki/cob_common"
SRC_URI="https://github.com/ipa320/${PN}-release/archive/release/indigo/${PN}/0.6.8-0.tar.gz -> ${PN}-indigo-release-${PV}.tar.gz"

LICENSE="Apache-2.0"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-indigo/cob_description
	ros-indigo/cob_msgs
	ros-indigo/cob_srvs
	ros-indigo/raw_description
"
DEPEND="${RDEPEND}
	ros-indigo/catkin
"

SLOT="0"
ROS_DISTRO="indigo"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
