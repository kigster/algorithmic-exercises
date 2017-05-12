#!/usr/bin/env bash

build::cpp() {
  [[ -z "${root}" ]] && find . -name "export_root.sh" -exec source {} \;

  section::h1 'Building C++ Projects...'
  cd ${root}/cpp
  cmake -Wno-dev .  
  make 

  section::h2 'Testing Equlibrium...'
  ./test/src/equilibrium/equilibriumTests

  section::h2 'Testing morseTest...'
  ./test/src/morse/morseTest

  cd ${root}
}
