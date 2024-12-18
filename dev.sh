# shellcheck shell=bash
###############################################################################
# Bash functions for project development
###############################################################################

function run_base_container() {
    docker run -it --rm \
        --mount "type=bind,source=.,target=/mnt" \
        --workdir "/mnt/installers/src" \
        mcr.microsoft.com/devcontainers/base:jammy \
        bash
}

function run_ubuntu() {
    docker run -it --rm \
        --mount "type=bind,source=.,target=/mnt" \
        --workdir "/mnt/installers/src" \
        ubuntu:latest \
        bash
}

function build() {
    mkdir -p build
    rm -rf build/*
    cp -r devcontainer-features build
    for feature_dir in build/devcontainer-features/src/*; do
        mkdir -p "$feature_dir/installers"
        cp -r installers/src/* "$feature_dir/installers"
    done;
}

function publish_features() {
    build
    pushd build/devcontainer-features/src
    devcontainer features publish --namespace sandor-juhasz/devcontainer-features .
    popd
}
