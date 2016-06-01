# -*- encoding: utf-8 -*-
require File.expand_path('../lib/nexposecli/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "nexposecli"
  spec.version       = Nexposecli::VERSION
  spec.authors       = ['Erik Gomez', 'frozenr7']
  spec.email         = ['erik_gomez@rapid7.com', 'frozen@pobox.com']

  spec.summary       = 'Ruby command-line utility for Rapid7 Nexpose'
  spec.description   = 'This experimental gem provides a Ruby command-line utility to the Nexpose vulnerability management product by Rapid7.'
  spec.homepage      = 'https://github.com/frozenr7/nexposecli'

  spec.files         = `git ls-files`.split($\)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.executables   = ["nexposecli"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.1'
  spec.add_runtime_dependency "nexpose", ">= 4.0.4"
  spec.add_runtime_dependency "netaddr", ">= 1.5.1"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
