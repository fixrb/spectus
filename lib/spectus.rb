# frozen_string_literal: true

require "matchi/helper"

require_relative File.join("spectus", "expectation_target")

# Namespace for the Spectus library.
#
# This module defines the {#it} method to create expectations, which can be
# automatically included into classes.
#
# @example
#   class Spec
#     include ::Spectus
#
#     attr_reader :subject
#
#     def initialize(subject)
#       @subject = subject
#     end
#
#     def test_a
#       it { subject.upcase }.MUST eql "FOO"
#     end
#
#     def test_b
#       it { subject.blank? }.MAY be_true
#     end
#
#     def test_c
#       it { subject.length }.SHOULD equal 42
#     end
#   end
#
#   t = Spec.new("foo")
#   t.test_a # => Spectus::Result::Pass(actual: "FOO", error: nil, expected: "FOO", got: true, matcher: :eql, negate: false, level: :MUST)
#   t.test_b # => Spectus::Result::Pass(actual: nil, error: #<NoMethodError: undefined method `blank?' for "foo":String>, expected: nil, got: nil, matcher: :be_true, negate: false, level: :MAY)
#   t.test_c # => Spectus::Result::Pass(actual: 3, error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :SHOULD)
#
# Or even directly used like this.
#
# @example
#   require 'spectus'
#
#   include Spectus
#
#   it { 42 }.MUST equal 42 # => Spectus::Result::Pass(actual: 42, error: nil, expected: 42, got: true, matcher: :equal, negate: false, level: :MUST
#
# It also includes a collection of expectation matchers 🤹
#
# @example Equivalence matcher
#   matcher = eql("foo") # => Matchi::Matcher::Eql.new("foo")
#   matcher.matches? { "foo" } # => true
#   matcher.matches? { "bar" } # => false
#
# @example Identity matcher
#   object = "foo"
#
#   matcher = equal(object) # => Matchi::Matcher::Equal.new(object)
#   matcher.matches? { object } # => true
#   matcher.matches? { "foo" } # => false
#
# @example Regular expressions matcher
#   matcher = match(/^foo$/) # => Matchi::Matcher::Match.new(/^foo$/)
#   matcher.matches? { "foo" } # => true
#   matcher.matches? { "bar" } # => false
#
# @example Expecting errors matcher
#   matcher = raise_exception(NameError) # => Matchi::Matcher::RaiseException.new(NameError)
#   matcher.matches? { Boom } # => true
#   matcher.matches? { true } # => false
#
# @example Truth matcher
#   matcher = be_true # => Matchi::Matcher::BeTrue.new
#   matcher.matches? { true } # => true
#   matcher.matches? { false } # => false
#   matcher.matches? { nil } # => false
#   matcher.matches? { 4 } # => false
#
# @example Untruth matcher
#   matcher = be_false # => Matchi::Matcher::BeFalse.new
#   matcher.matches? { false } # => true
#   matcher.matches? { true } # => false
#   matcher.matches? { nil } # => false
#   matcher.matches? { 4 } # => false
#
# @example Nil matcher
#   matcher = be_nil # => Matchi::Matcher::BeNil.new
#   matcher.matches? { nil } # => true
#   matcher.matches? { false } # => false
#   matcher.matches? { true } # => false
#   matcher.matches? { 4 } # => false
#
# @example Type/class matcher
#   matcher = be_an_instance_of(String) # => Matchi::Matcher::BeAnInstanceOf.new(String)
#   matcher.matches? { "foo" } # => true
#   matcher.matches? { 4 } # => false
#
# @see https://github.com/fixrb/matchi
module Spectus
  include ::Matchi::Helper

  # Expectations are built with this method.
  #
  # @example An _absolute requirement_ definition.
  #   it { 42 }.MUST equal 42 # => Spectus::Result::Pass(actual: 42, error: nil, expected: 42, got: true, matcher: :equal, negate: false, level: :MUST
  #
  # @param input [Proc] The code to test.
  #
  # @return [ExpectationTarget] The expectation target.
  def it(&input)
    ExpectationTarget.new(&input)
  end
end
