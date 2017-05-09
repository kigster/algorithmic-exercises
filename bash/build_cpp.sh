#!/usr/bin/env bash

build::cpp() {
  section::h1 'Building C++ Projects...'
  cd ${root}/cpp/equillibrium/
  cmake -Wno-dev .  > /dev/null
  make > /dev/null

  section::h2 'Testing C++ Projects...'
  ./test/src/equilibriumTests
  cd ${root}
}
