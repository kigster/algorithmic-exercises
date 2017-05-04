# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'codility/version'

Gem::Specification.new do |spec|
  spec.name          = 'codility'
  spec.version       = Codility::VERSION
  spec.authors       = ['Konstantin Gredeskoul']
  spec.email         = ['kig@reinvent.one']

  spec.summary       = %q{Codility examples}
  spec.description   = %q{Codility examples}
  spec.homepage      = 'https://github.com/kigster/codility-tests'
  spec.license       = 'MIT'

  spec.files         = `git ls-files `.split("\n").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-benchmark'
  spec.add_development_dependency 'rspec-its'
end

