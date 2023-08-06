#!/bin/bash
###############################################################################
#
# Installs the `pyenv` application.
#
# Environment:
#    USERNAME   The user for which pyenv is configured.
###############################################################################

set -e

source lib/common.sh

echo "Installing pyenv..."
echo "==================="

if [[ "$USERNAME" == "root" ]]; then
    user_home_dir="/root"
else 
    user_home_dir="/home/$USERNAME"
fi
echo "Using home directory: $user_home_dir"

if [ ! -d "$user_home_dir/.pyenv" ]; then 
    echo "~/.pyenv directory was not found. Installing pyenv for $USERNAME..."

    export DEBIAN_FRONTEND=noninteractive

    apt_install git curl ca-certificates

    as_user "cd /home/developer; curl https://pyenv.run | bash"

    cat <<'EOF' >"/home/$USERNAME/.bash_profile"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Restart your shell for the changes to take effect.

# Load pyenv-virtualenv automatically by adding
# the following to ~/.bashrc:

eval "$(pyenv virtualenv-init -)"
EOF
else
    echo "Pyenv is already installed, skipping this step."
fi