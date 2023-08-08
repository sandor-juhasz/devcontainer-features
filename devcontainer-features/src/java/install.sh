#!/bin/bash
set -e

export JAVA_VERSION="${JAVAVERSION:-""}"
export INSTALL_MAVEN="${INSTALLMAVEN:-"true"}"
export MAVEN_VERSION="${MAVENVERSION:-""}"

cd installers
./install java-development-tools
