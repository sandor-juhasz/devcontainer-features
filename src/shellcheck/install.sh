#!/bin/bash
set -e

echo "Activating feature 'shellcheck'"

apt-get update
apt-get install -y shellcheck
