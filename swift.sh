#!/bin/bash
# Copyright (c) 2022 Jaehong Kang
# Licensed under Apache License v2.0

set -o pipefail

function outputHandler() {
    while read LINE
    do
        LINE="$(echo "$LINE" | sed -E 's/^(\/[^:]+):([0-9]+):([0-9]+): (warning|error): (.*)/::\4 file=\1,line=\2,col=\3::\5/g')"
        case $LINE in
        ::*)
            echo "$LINE"
            ;;
        esac
    done
}

swift "$@" | outputHandler
