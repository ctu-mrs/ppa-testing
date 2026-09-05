#!/bin/bash

set -e

trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "$0: \"${last_command}\" command failed with exit code $?"' ERR

echo "$0: Adding MRS Testing PPA repository"

sudo apt-get --no-install-recommends -o Acquire::Retries=4 -y install curl gpg dpkg-dev

ARCH=$(dpkg-architecture -qDEB_HOST_ARCH)
sudo curl -s --compressed --retry 4 --retry-connrefused -o /etc/ros/rosdep/sources.list.d/ctu-mrs-testing.list "https://ctu-mrs.github.io/ppa-testing/ctu-mrs-$ARCH.list"
curl -s --compressed --retry 4 --retry-connrefused https://ctu-mrs.github.io/ppa-testing/add_sources_ppa.sh | bash
rosdep --include-eol-distros --rosdistro=noetic update

echo "$0: Finished adding MRS Testing PPA repository"
