#!/bin/bash
set -e

ls -l
echo $(pwd)

echo "installing shellcheck."
./installers/shellcheck.sh install

echo "installing bash kernel."
./installers/bash_kernel.sh install
