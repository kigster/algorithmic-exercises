#!/usr/bin/env bash

set -e

root=$(pwd)

cd ${root}/ruby 
gem install bundler  --no-ri --no-rdoc > /dev/null
bundle install >/dev/null
bundle exec rspec

cd ${root}/cpp/equillibrium/
cmake .  > /dev/null
make > /dev/null

./test/src/equilibriumTests

cd ${root}

