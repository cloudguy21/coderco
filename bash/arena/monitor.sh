#!/bin/bash

inotifywait -m -e create -e modify -e delete \
--timefmt '%Y-%m-%d %H:%M:%S' \
--format '%T %e %w%f' \
. >> ../changes.log