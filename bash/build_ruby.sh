
build::ruby() {
  section::h1 'Building Ruby Projects...'
  cd ${root}/ruby
  gem install bundler  --no-ri --no-rdoc > /dev/null
  echo "Installing dependent gems..."
  bundle install >/dev/null
  section::h1 'Testing Ruby Projects...'
  bundle exec rspec
  bundle exec codeclimate-test-reporter
  cd ${root}
}
