# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = 'spectus'
  spec.version       = File.read('VERSION.semver').chomp
  spec.authors       = ['Cyril Kato']
  spec.email         = ['contact@cyril.email']
  spec.summary       = 'Expectation library with RFC 2119 keywords.'
  spec.description   = "Expectation library with RFC 2119's requirement levels."
  spec.homepage      = 'https://github.com/fixrb/spectus'
  spec.license       = 'MIT'

  spec.files         =
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^test/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'defi',                   '~> 2.0.0'
  spec.add_dependency 'matchi',                 '~> 1.0.8'

  spec.add_development_dependency 'bundler',    '~> 2.0'
  spec.add_development_dependency 'rake',       '~> 13.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'simplecov',  '~> 0.17'
  spec.add_development_dependency 'yard',       '~> 0.9'
end
