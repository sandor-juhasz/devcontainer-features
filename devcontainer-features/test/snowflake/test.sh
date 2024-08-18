#!/bin/bash

set -e

source dev-container-features-test-lib

check "SnowSQL is available" which snowsql
check "SnowSQL can be executed" bash -c "snowsql"
check "Snowflake CLI is available" which snow
check "Snowflake CLI can be executed" bash -c "snow"

reportResults
