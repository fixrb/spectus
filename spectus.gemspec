# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name         = 'spectus'
  spec.version      = File.read('VERSION.semver').chomp
  spec.author       = 'Cyril Kato'
  spec.email        = 'contact@cyril.email'
  spec.summary      = "Expectation library with RFC 2119's requirement levels."
  spec.description  = spec.summary
  spec.homepage     = 'https://github.com/fixrb/spectus'
  spec.license      = 'MIT'
  spec.files        = Dir['LICENSE.md', 'README.md', 'lib/**/*']

  spec.add_dependency 'aw',                     '~> 0.1.6'
  spec.add_dependency 'defi',                   '~> 1.1.5'
  spec.add_dependency 'matchi',                 '~> 1.0.4'

  spec.add_development_dependency 'bundler',    '~> 2.0'
  spec.add_development_dependency 'rake',       '~> 13.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'simplecov',  '~> 0.17'
  spec.add_development_dependency 'yard',       '~> 0.9'
end
