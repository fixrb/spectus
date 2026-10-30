# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name                   = "spectus"
  spec.version                = File.read(File.join(__dir__, "VERSION.semver")).chomp
  spec.author                 = "Cyril Kato"
  spec.email                  = "contact@cyril.email"
  spec.summary                = "Expectations with the requirement levels of RFC 2119"
  spec.description            = "An expectation is a level (MUST, SHOULD or MAY), a negation and a matcher; " \
                                "called with a block, it gives a result that says how it went, without raising."
  spec.homepage               = "https://fixrb.dev/gems/spectus/"
  spec.license                = "MIT"
  spec.files                  = Dir["LICENSE.md", "README.md", "lib/**/*.rb", base: __dir__]
  spec.required_ruby_version  = ">= 3.3.0"

  spec.metadata["bug_tracker_uri"]       = "https://github.com/fixrb/spectus/issues"
  spec.metadata["changelog_uri"]         = "https://github.com/fixrb/spectus#changes-in-601"
  spec.metadata["documentation_uri"]     = "https://rubydoc.info/gems/spectus"
  spec.metadata["rubygems_mfa_required"] = "true"
  spec.metadata["source_code_uri"]       = "https://github.com/fixrb/spectus"

  spec.add_dependency "defi", "~> 4.0"
end
