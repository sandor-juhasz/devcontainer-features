#!/bin/bash

set -e

source dev-container-features-test-lib

check "Snow CLI is in /usr/local/bin " bash -c '[ "$(which snow)" == "/usr/local/bin/snow" ]'
check "Snow CLI version is 3.13.1" bash -c "snow --version | grep '3.13.1'"

reportResults
