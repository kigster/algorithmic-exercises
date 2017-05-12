
build::ruby() {
  [[ -z "${root}" ]] && find . -name "export_root.sh" -exec source {} \;
  section::h1 'Building Ruby Projects...'
  cd ${root}/ruby
  gem install bundler  --no-ri --no-rdoc > /dev/null
  echo "Installing dependent gems..."
  bundle install >/dev/null
  section::h2 'Testing Ruby Projects...'
  bundle exec rspec
  cd ${root}
}
