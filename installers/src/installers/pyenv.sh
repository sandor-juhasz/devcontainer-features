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

export DEBIAN_FRONTEND=noninteractive

apt_install git curl ca-certificates

echo "Installing pyenv for $USERNAME..."

as_user "rm -rf ~/.pyenv"
as_user "cd /home/developer; echo $HOME; curl https://pyenv.run | bash"

cat <<'EOF' >"/home/$USERNAME/.bash_profile"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Restart your shell for the changes to take effect.

# Load pyenv-virtualenv automatically by adding
# the following to ~/.bashrc:

eval "$(pyenv virtualenv-init -)"
EOF
