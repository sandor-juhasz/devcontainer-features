# shellcheck shell=bash
###############################################################################
# APT functions
#
# Recommended usage:
#
# ```shell
# apt_set_noninteractive
# apt_clear_package_index
#
# apt_install_if_missing mc tmux
#
# apt_cleanup
# ```
###############################################################################

#
# Configures APT to be non-interactive for the rest of the script.
#
function apt_set_noninteractive() {
    export DEBIAN_FRONTEND=noninteractive
}


#
# Deletes the package index. The index can be downloaded using `apt-get update`
# Downloading the index takes considerable amount of time. It is a good practice
# to clear the index only at the beginning of a component installation or when
# the apt repository is extended with a new repository. This way, individual
# packages can be installed when needed without updating the index first.
#
function apt_clear_package_index() {
    rm -rf /var/lib/apt/lists/*
}


function apt_clear_package_cache() {
    apt-get clean
}


function apt_cleanup() {
    apt_clear_package_cache
    apt_clear_package_index
}


#
# Updates the package index if it was deleted.
#
function apt_update_index_if_empty() {
    if [ "$(find /var/lib/apt/lists | wc -l)" = "1" ]; then
        echo "Running apt-get update..."
        apt-get update -y
    fi
}


#
# Returns 0 if all packages passed as arguments are installed
#
function apt_check_packages_installed() {
    dpkg -s "$@" > /dev/null 2>&1
}


function apt_install() {
    export DEBIAN_FRONTEND=noninteractive
    if ! apt_check_packages_installed "$@"; then
        apt_update_index_if_empty
        apt-get -y install --no-install-recommends "$@"
    fi
}

function as_user() {
    local cmd="$*"
    if [ "$(id -u)" -eq 0 ] && [ "$USERNAME" != "root" ]; then
        su --login "$USERNAME" -c "$cmd"
    else
        "$cmd"
    fi
}


function default_user() {
    local possible_users=("vscode" "node" "codespace" "$(awk -v val=1000 -F ":" '$3==val{print $1}' /etc/passwd)")
    for current_user in "${possible_users[@]}"; do
        if id -u "${current_user}" > /dev/null 2>&1; then
            echo "$current_user"
            return 0
        fi
    done
    echo "root"
}
