#!/bin/bash
# Copyright (c) 2022 Jaehong Kang
# Licensed under Apache License v2.0

set -o pipefail

BASE_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

swift "$@" | "$BASE_DIR/libexec/github-action-output-handler"
