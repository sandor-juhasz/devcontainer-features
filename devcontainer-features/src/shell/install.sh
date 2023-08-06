#!/bin/bash
set -e

export INSTALL_BASH_KERNEL="${INSTALLBASHKERNEL:-"true"}"

cd installers
./install bash-development-tools
