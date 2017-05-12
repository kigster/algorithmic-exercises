#!/usr/bin/env bash

build::setup() { 
  git submodule init
  git submodule update
}
