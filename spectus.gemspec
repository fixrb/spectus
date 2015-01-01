Gem::Specification.new do |spec|
  spec.name          = 'spectus'
  spec.version       = File.read('VERSION.semver')
  spec.authors       = ['Cyril Wack']
  spec.email         = ['cyril@sashite.com']
  spec.summary       = 'Expectation library.'
  spec.description   = 'Expectation library with some matchers for Ruby.'
  spec.homepage      = 'https://github.com/fixrb/spectus'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(/^test\//)
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.0.0'

  spec.add_development_dependency 'bundler',    '~> 1.7'
  spec.add_development_dependency 'rake',       '~> 10.4'
  spec.add_development_dependency 'yard',       '~> 0.8'
  spec.add_development_dependency 'coveralls',  '~> 0.7'
  spec.add_development_dependency 'rubocop',    '~> 0.28'

  private_key = File.expand_path '~/.gemcert/spectus-gem-private_key.pem'
  if File.exist? private_key
    spec.signing_key = private_key
    spec.cert_chain  = ['spectus.pem']
  end
end
