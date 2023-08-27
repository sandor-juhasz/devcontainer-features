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
# Installs basic tools which are needed to install any APT package.
#
function apt_install_prerequisites() {
    apt_install apt-transport-https ca-certificates curl gpg
}

#
# Adds a new APT source.
#
# Example usage:
#
#  apt_install_prerequisites
#  apt_add_source kubernetes \
#      "https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key" \
#      "https://pkgs.k8s.io/core:/stable:/v1.28/deb/" \
#      "/"
#
function apt_add_source() {
    local source_name="$1"
    local key_url="$2"
    local repo_url="$3"
    local rest="$4"

    local keyring_file="/etc/apt/keyrings/${source_name}.gpg"
    local apt_source_file="/etc/apt/sources.list.d/${source_name}.list"

    mkdir -p /etc/apt/keyrings
    if [[ -e "${keyring_file}" ]]; then
        rm "${keyring_file}"
    fi

    curl -fsSL "${key_url}" | gpg --dearmor -o "${keyring_file}"
    echo "deb [arch=$(dpkg --print-architecture) signed-by=${keyring_file}] ${repo_url} ${rest}" | tee "${apt_source_file}"    

    apt-get update
}

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
