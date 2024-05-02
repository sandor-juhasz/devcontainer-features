#!/bin/bash
set -e

export JAVA_VERSION="${JAVAVERSION:-""}"
export INSTALL_MAVEN="${INSTALLMAVEN:-"true"}"
export MAVEN_VERSION="${MAVENVERSION:-""}"
export INSTALL_IJAVA_KERNEL="${INSTALLIJAVAKERNEL:-"true"}"
export INSTALL_JMETER="${INSTALLJMETER:-"false"}"
export INSTALL_VISUALVM="${INSTALLVISUALVM:-"false"}"
export INSTALL_JDK_MISSION_CONTROL="${INSTALLJDKMISSIONCONTROL:-"false"}"

cd installers
./install java-development-tools
