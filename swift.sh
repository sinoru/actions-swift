#!/bin/bash
# Copyright (c) 2022 Jaehong Kang
# Licensed under Apache License v2.0

set -o pipefail

function outputHandler() {
    while read LINE
    do
        WORKFLOW_COMMANDS="$(echo "$LINE" | sed -E 's/^(\/[^:]+):([0-9]+):([0-9]+): (warning|error): (.*)/::\4 file=\1,line=\2,col=\3,title=\4::\5/g')"

        LINE="$(echo "$LINE" | sed -E 's/^(\/[^:]+):([0-9]+):([0-9]+): (warning|error): (.*)/::\4 file=\1,line=\2,col=\3,title=\4::\5/g')"
        case $WORKFLOW_COMMANDS in
        "")
            echo "$LINE" ;;
        *)
            echo "$WORKFLOW_COMMANDS" ;;
        esac
    done
}

swift "$@" | outputHandler
