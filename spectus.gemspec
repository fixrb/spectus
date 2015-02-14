Gem::Specification.new do |spec|
  spec.name          = 'spectus'
  spec.version       = File.read('VERSION.semver')
  spec.authors       = ['Cyril Wack']
  spec.email         = ['contact@cyril.email']

  spec.summary       = 'Expectation library with requirement levels.'
  spec.description   = 'Expectation library with RFC 2119\'s requirement ' \
                       'levels, and some matchers for Ruby.'
  spec.homepage      = 'https://github.com/fixrb/spectus'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(/^test\//) }
  spec.executables   = spec.files.grep(/^exe\//) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'expect',                 '~> 0.0.4'

  spec.add_development_dependency 'bundler',    '~> 1.8'
  spec.add_development_dependency 'rake',       '~> 10.0'
  spec.add_development_dependency 'yard',       '~> 0.8'
  spec.add_development_dependency 'simplecov',  '~> 0.9.1'
  spec.add_development_dependency 'rubocop',    '~> 0.29'

  private_key = File.expand_path '~/.gem/spectus-gem-private_key.pem'
  if File.exist? private_key
    spec.signing_key = private_key
    spec.cert_chain  = ['spectus-gem-public_cert.pem']
  end
end
