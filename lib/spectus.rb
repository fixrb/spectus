# frozen_string_literal: true

require_relative "spectus/requirement"

# Expectations with the requirement levels of RFC 2119. A requirement is a
# level (MUST, SHOULD or MAY), a negation and a matcher; called with a block,
# it gives a result, a value that says how the expectation went, and never
# raises for an expectation that is not met.
#
# @example
#   require "matchi"
#
#   result = Spectus.must(Matchi::Eq.new(42)).call { 6 * 7 }
#   result.passed? # => true
#   result.to_s    # => "Success: expected 42 to eq 42"
module Spectus
  # @param matcher [#match?] the matcher
  # @return [Spectus::Requirement] an absolute requirement
  def self.must(matcher)
    Requirement.new(level: :MUST, negate: false, matcher:)
  end

  # @param matcher [#match?] the matcher
  # @return [Spectus::Requirement] an absolute prohibition
  def self.must_not(matcher)
    Requirement.new(level: :MUST, negate: true, matcher:)
  end

  # @param matcher [#match?] the matcher
  # @return [Spectus::Requirement] a recommendation
  def self.should(matcher)
    Requirement.new(level: :SHOULD, negate: false, matcher:)
  end

  # @param matcher [#match?] the matcher
  # @return [Spectus::Requirement] a negated recommendation
  def self.should_not(matcher)
    Requirement.new(level: :SHOULD, negate: true, matcher:)
  end

  # @param matcher [#match?] the matcher
  # @return [Spectus::Requirement] an option, which has no negative form
  def self.may(matcher)
    Requirement.new(level: :MAY, negate: false, matcher:)
  end
end
