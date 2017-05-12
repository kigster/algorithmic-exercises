#!/usr/bin/env bash

set -e

source .bash_init

build::setup
build::cpp
build::ruby
