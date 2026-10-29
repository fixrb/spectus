# frozen_string_literal: true

require_relative File.join("support", "coverage")
require_relative File.join("..", "lib", "spectus")
require "matchi"

# Each function of the module builds the requirement of its level and
# negation, with the matcher as given.
eq = Matchi::Eq.new(42)
built = {
  must:       [:MUST, false],
  must_not:   [:MUST, true],
  should:     [:SHOULD, false],
  should_not: [:SHOULD, true],
  may:        [:MAY, false]
}
built.each do |function, (level, negate)|
  requirement = Spectus.public_send(function, eq)
  raise unless requirement == Spectus::Requirement.new(level:, negate:, matcher: eq)
  raise unless requirement.matcher.equal?(eq) && requirement.call { negate ? 1 : 42 }.passed?
end
raise unless Spectus.methods(false).sort == %i[may must must_not should should_not]
raise if Spectus.respond_to?(:may_not)

# The gem needs defi only, and ships the library, the licence and the README.
spec = Gem::Specification.load(File.expand_path(File.join("..", "spectus.gemspec"), __dir__))
raise unless spec.runtime_dependencies.map(&:name) == ["defi"] && spec.development_dependencies.empty?
raise unless spec.files.sort == %w[LICENSE.md README.md lib/spectus.rb lib/spectus/requirement.rb
                                   lib/spectus/result.rb lib/spectus/text.rb]
raise unless $LOADED_FEATURES.any? { |path| path.end_with?("/defi/challenge.rb") }
raise unless Spectus.constants.sort == %i[Requirement Result]
