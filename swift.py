#!/usr/bin/env python3
import sys
import subprocess

swift = subprocess.Popen(["swift", *sys.argv], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)

while swift.poll() == None:
    stdout = swift.stdout.readline()
    stderr = swift.stderr.readline()

    print(stdout, end=None, file=sys.stdout)
    print(stderr, end=None, file=sys.stderr)
