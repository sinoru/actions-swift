#!/bin/bash
# Copyright (c) 2022 Jaehong Kang
# Licensed under Apache License v2.0

set -o pipefail

function outputHandler() {
    cat
}

swift "$@" | outputHandler
