Gem::Specification.new do |spec|
  spec.name          = 'spectus'
  spec.version       = File.read('VERSION.semver').chomp
  spec.authors       = ['Cyril Wack']
  spec.email         = ['contact@cyril.email']

  spec.summary       = 'Expectation library with RFC 2119 keywords.'
  spec.description   = "Expectation library with RFC 2119's requirement levels."
  spec.homepage      = 'https://github.com/fixrb/spectus'
  spec.license       = 'MIT'

  spec.files         =
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^test/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'defi',                   '~> 1.1.0'
  spec.add_dependency 'matchi',                 '~> 0.0.9'

  spec.add_development_dependency 'bundler',    '~> 1.10'
  spec.add_development_dependency 'rake',       '~> 10.4'
  spec.add_development_dependency 'yard',       '~> 0.8'
  spec.add_development_dependency 'simplecov',  '~> 0.10'
  spec.add_development_dependency 'rubocop',    '~> 0.32'

  spec.cert_chain   = ['certs/gem-fixrb-public_cert.pem']
  private_key       = File.expand_path('~/.ssh/gem-fixrb-private_key.pem')
  spec.signing_key  = private_key if File.exist?(private_key)
end
