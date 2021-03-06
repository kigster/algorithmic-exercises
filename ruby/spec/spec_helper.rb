require 'bundler/setup'
require 'simplecov'

SimpleCov.start 

require 'interview/ruby'
require 'rspec-benchmark'
require 'rspec/its'
require 'complexity_assert'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.include RSpec::Benchmark::Matchers
end
