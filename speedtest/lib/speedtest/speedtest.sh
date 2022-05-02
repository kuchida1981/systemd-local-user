#!/usr/bin/env bash

set -eu pipefail

readonly prefix=$(cd $(dirname $0) && pwd)/../..
readonly speedtest_cmd="$prefix/opt/speedtest/speedtest"
$speedtest_cmd -f json --servers | \
    jq '.servers[] | select (.country == "Japan") | .id' | \
    while read server_id; do
        $speedtest_cmd -s $server_id -f json
    done

