#!/bin/bash

set -e

source dev-container-features-test-lib

check "SnowSQL version is 1.3.0" snowsql --version | grep "1.3.0"

reportResults
