# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name                   = "spectus"
  spec.version                = File.read("VERSION.semver").chomp
  spec.author                 = "Cyril Kato"
  spec.email                  = "contact@cyril.email"
  spec.summary                = "Expectation library with RFC 2119's requirement levels 🚥"
  spec.description            = spec.summary
  spec.homepage               = "https://github.com/fixrb/spectus"
  spec.license                = "MIT"
  spec.files                  = Dir["LICENSE.md", "README.md", "lib/**/*"]
  spec.required_ruby_version  = ">= 3.2.0"

  spec.metadata["rubygems_mfa_required"] = "true"

  spec.add_dependency "expresenter", "~> 1.5.0"
  spec.add_dependency "matchi", "~> 4.0"
  spec.add_dependency "test_tube", "~> 4.0.0"
end
