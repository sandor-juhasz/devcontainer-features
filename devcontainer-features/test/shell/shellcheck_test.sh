#!/bin/bash
set -e
source  dev-container-features-test-lib
check "validate shellcheck" ! which shellcheck
