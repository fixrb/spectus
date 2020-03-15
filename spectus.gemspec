# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name         = 'spectus'
  spec.version      = File.read('VERSION.semver').chomp
  spec.author       = 'Cyril Kato'
  spec.email        = 'contact@cyril.email'
  spec.summary      = "Expectation library with RFC 2119's requirement levels 🚥"
  spec.description  = spec.summary
  spec.homepage     = 'https://github.com/fixrb/spectus'
  spec.license      = 'MIT'
  spec.files        = Dir['LICENSE.md', 'README.md', 'lib/**/*']

  spec.required_ruby_version = '>= 2.3.0'

  spec.add_dependency 'defi',   '~> 2.0.3'
  spec.add_dependency 'matchi', '~> 2.0.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'rubocop-thread_safety'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'yard'
end
