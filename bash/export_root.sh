#!/usr/bin/env bash

root::init() { 
  root=$(pwd)
  if [[ -s "${root}/build.sh" ]] ; then
    export root=$(pwd)
  else
    printf "${bldred}Current directory must be at the project's root.${txtrst}\n" >&2
    return 127 
  fi
}

root::init

result=$?

if [[ ${result} == 127 ]] ; then
  if [[ ${0} =~ "export_root.sh" ]]; then 
    exit 127
  else
    return 127
  fi
fi

