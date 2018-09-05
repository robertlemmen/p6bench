#!/bin/bash

set -e

for bm in $(ls  | sort); do
    echo "# running $bm"...
    { time ls ./$bm; } 2>&1
    echo "# bm run complete"...
done
echo "all done!"
