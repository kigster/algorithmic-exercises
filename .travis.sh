#!/usr/bin/env bash

set -e

root=$(pwd)

cd ${root}/ruby 
gem install bundler  --no-ri --no-rdoc
bundle install 
bundle exec rspec

cd ${root}/cpp/equillibrium/
cmake . 
make
./test/src/equilibriumTests

cd ${root}

