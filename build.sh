#!/usr/bin/env bash

set -e

root=$(pwd)
source ${root}/bash/libutil.sh


build::cpp
build::ruby
