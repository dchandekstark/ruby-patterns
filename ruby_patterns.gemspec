# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_patterns/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby_patterns"
  spec.version       = RubyPatterns::VERSION
  spec.authors       = ["David Chandek-Stark"]
  spec.email         = ["dchandekstark@gmail.com"]

  spec.summary       = "Ruby implementations of various design patterns."
  spec.homepage      = "https://github.com/dchandekstark/ruby_patterns"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
