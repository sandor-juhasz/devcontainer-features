#!/bin/bash

set -e

source dev-container-features-test-lib

check "Snow CLI location is in ~/.local/bin" bash -c "which snow | grep '^/home/vscode/.local/bin/snow$'"

reportResults
