#!/bin/bash
set -e
source  dev-container-features-test-lib
check "validate shellcheck" shellcheck --version | grep 'ShellCheck - shell script analysis tool'
