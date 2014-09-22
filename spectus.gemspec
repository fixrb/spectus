Gem::Specification.new do |spec|
  spec.name          = 'spectus'
  spec.version       = File.read('VERSION.semver')
  spec.authors       = ['Cyril Wack']
  spec.email         = ['cyril@sashite.com']
  spec.summary       = %q{Expectation library.}
  spec.description   = %q{An expectation library with some matchers for Ruby.}
  spec.homepage      = 'https://github.com/cyril/spectus.rb'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^test/})
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.0.0'

  spec.add_development_dependency 'bundler',    '~> 1.7'
  spec.add_development_dependency 'rake',       '~> 10.0'
  spec.add_development_dependency 'yard',       '~> 0.8'
  spec.add_development_dependency 'coveralls',  '~> 0.7'
end