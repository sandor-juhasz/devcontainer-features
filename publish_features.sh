#!/bin/bash
#
# Assembles and publishes the features

mkdir -p build
rm -rf build/*
cp -r devcontainer-features build
for feature_dir in build/devcontainer-features/src/*; do
    mkdir -p "$feature_dir/installers"
    cp -r installers/src/* "$feature_dir/installers"
done;

pushd build/devcontainer-features/src
devcontainer features publish --namespace sandor-juhasz/devcontainer-features .
popd




