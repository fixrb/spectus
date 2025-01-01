# frozen_string_literal: true

require_relative File.join("spectus", "requirement")

# A Ruby library for defining expectations with precision using RFC 2119 compliance levels.
#
# This module provides methods to define expectations according to different requirement
# levels (MUST, SHOULD, MAY). Each method accepts a matcher object that responds to `match?`
# and follows the block-passing protocol.
#
# While the {https://github.com/fixrb/matchi Matchi gem} provides a collection of ready-to-use
# matchers, you can create your own custom matchers:
#
# @example Creating a custom matcher
#   class BeTheAnswer
#     def match?
#       42.equal?(yield)
#     end
#   end
#
#   test = Spectus.must BeTheAnswer.new
#   test.call { 42 } # => pass
#   test.call { 41 } # => fail
#
# @example Using with Matchi gem
#   require "spectus"
#   require "matchi/eq"
#
#   test = Spectus.must Matchi::Eq.new(42)
#   test.call { 42 } # => pass
#
# @see https://www.ietf.org/rfc/rfc2119.txt RFC 2119 specification
# @see https://github.com/fixrb/matchi Matchi - Collection of compatible matchers
module Spectus
  # Defines an absolute requirement that must be satisfied by the implementation.
  # This represents the RFC 2119 "MUST" level - an absolute requirement of the specification.
  #
  # @example With a custom matcher
  #   class PositiveNumber
  #     def match?
  #       (yield).positive?
  #     end
  #   end
  #
  #   test = Spectus.must PositiveNumber.new
  #   test.call { 42 }
  #   # => #<Expresenter::Pass actual: 42, ...>
  #
  # @example With Matchi gem
  #   require "spectus"
  #   require "matchi/eq"
  #
  #   test = Spectus.must Matchi::Eq.new(42)
  #   test.call { 42 }
  #   # => #<Expresenter::Pass actual: 42, ...>
  #
  # @param matcher [#match?] Any object that implements the matcher protocol:
  #   - Responds to `match?`
  #   - Accepts a block in `match?` that provides the actual value
  # @return [Requirement::Required] An absolute requirement level instance
  # @raise [ArgumentError] If matcher doesn't respond to match?
  #
  # @api public
  def self.must(matcher)
    raise ::ArgumentError, "matcher must respond to match?" unless matcher.respond_to?(:match?)

    Requirement::Required.new(negate: false, matcher:)
  end

  # Defines an absolute prohibition in the specification.
  # This represents the RFC 2119 "MUST NOT" level - an absolute prohibition.
  #
  # @example With a custom matcher
  #   class NegativeNumber
  #     def match?
  #       (yield).negative?
  #     end
  #   end
  #
  #   test = Spectus.must_not NegativeNumber.new
  #   test.call { 42 }
  #   # => #<Expresenter::Pass actual: 42, ...>
  #
  # @example With Matchi gem
  #   require "spectus"
  #   require "matchi/be"
  #
  #   test = Spectus.must_not Matchi::Be.new(0)
  #   test.call { 42 }
  #   # => #<Expresenter::Pass actual: 42, ...>
  #
  # @param matcher [#match?] Any object that implements the matcher protocol
  # @return [Requirement::Required] An absolute prohibition level instance
  # @raise [ArgumentError] If matcher doesn't respond to match?
  def self.must_not(matcher)
    raise ::ArgumentError, "matcher must respond to match?" unless matcher.respond_to?(:match?)

    Requirement::Required.new(negate: true, matcher:)
  end

  # Defines a recommended requirement that should be satisfied unless there are valid reasons not to.
  # This represents the RFC 2119 "SHOULD" level - where valid reasons may exist to ignore
  # a particular item, but the implications must be understood and weighed.
  #
  # @example With a custom matcher
  #   class EvenNumber
  #     def match?
  #       (yield).even?
  #     end
  #   end
  #
  #   test = Spectus.should EvenNumber.new
  #   test.call { 42 }
  #   # => #<Expresenter::Pass actual: 42, ...>
  #
  # @example With Matchi gem
  #   require "spectus"
  #   require "matchi/be"
  #
  #   test = Spectus.should Matchi::Be.new(:even?)
  #   test.call { 42 }
  #   # => #<Expresenter::Pass actual: 42, ...>
  #
  # @param matcher [#match?] Any object that implements the matcher protocol
  # @return [Requirement::Recommended] A recommended requirement level instance
  # @raise [ArgumentError] If matcher doesn't respond to match?
  def self.should(matcher)
    raise ::ArgumentError, "matcher must respond to match?" unless matcher.respond_to?(:match?)

    Requirement::Recommended.new(negate: false, matcher:)
  end

  # Defines a behavior that is not recommended but may be acceptable in specific circumstances.
  # This represents the RFC 2119 "SHOULD NOT" level - where particular behavior may be acceptable
  # but the implications should be understood and the case carefully weighed.
  #
  # @example With a custom matcher
  #   class RaisesError
  #     def match?
  #       yield
  #       false
  #     rescue
  #       true
  #     end
  #   end
  #
  #   test = Spectus.should_not RaisesError.new
  #   test.call { 42 }
  #   # => #<Expresenter::Pass actual: 42, ...>
  #
  # @example With Matchi gem
  #   require "spectus"
  #   require "matchi/raise_exception"
  #
  #   test = Spectus.should_not Matchi::RaiseException.new(StandardError)
  #   test.call { 42 }
  #   # => #<Expresenter::Pass actual: 42, ...>
  #
  # @param matcher [#match?] Any object that implements the matcher protocol
  # @return [Requirement::Recommended] A not recommended requirement level instance
  # @raise [ArgumentError] If matcher doesn't respond to match?
  def self.should_not(matcher)
    raise ::ArgumentError, "matcher must respond to match?" unless matcher.respond_to?(:match?)

    Requirement::Recommended.new(negate: true, matcher:)
  end

  # Defines an optional feature or behavior.
  # This represents the RFC 2119 "MAY" level - where an item is truly optional.
  # Implementations can freely choose whether to include the item based on their
  # specific needs, while maintaining interoperability with other implementations.
  #
  # For MAY requirements, a test passes in two cases:
  # 1. When a NoMethodError is raised, indicating the feature is not implemented
  # 2. When the feature is implemented and the test succeeds
  #
  # @example With a custom matcher testing an optional method
  #   class RespondsTo
  #     def initialize(method)
  #       @method = method
  #     end
  #
  #     def match?
  #       (yield).respond_to?(@method)
  #     end
  #   end
  #
  #   test = Spectus.may RespondsTo.new(:to_h)
  #   test.call { {} }                  # => pass (feature is implemented)
  #   test.call { BasicObject.new }     # => pass (NoMethodError - feature not implemented)
  #
  # @example With Matchi gem
  #   require "spectus"
  #   require "matchi/predicate"
  #
  #   test = Spectus.may Matchi::Predicate.new(:be_frozen)
  #   test.call { "".freeze }           # => pass (feature is implemented)
  #   test.call { BasicObject.new }     # => pass (NoMethodError - feature not implemented)
  #
  # @param matcher [#match?] Any object that implements the matcher protocol
  # @return [Requirement::Optional] An optional requirement level instance
  # @raise [ArgumentError] If matcher doesn't respond to match?
  def self.may(matcher)
    raise ::ArgumentError, "matcher must respond to match?" unless matcher.respond_to?(:match?)

    Requirement::Optional.new(negate: false, matcher:)
  end
end
