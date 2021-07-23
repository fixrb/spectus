# frozen_string_literal: true

require_relative File.join("spectus", "requirement")

# Namespace for the Spectus library.
#
# This module defines methods that can be used to qualify expectations in
# specifications.
module Spectus
  # This method mean that the definition is an absolute requirement of the
  # specification.
  #
  # @example An absolute requirement definition
  #   require "spectus"
  #   require "matchi/eq"
  #
  #   Spectus.must Matchi::Eq.new("FOO")
  #   # => #<MUST Matchi::Eq("FOO") isolate=false negate=false>
  #
  # @param matcher [#matches?] The matcher.
  #
  # @return [Requirement::Required] An absolute requirement level instance.
  #
  # @api public
  def self.must(matcher)
    Requirement::Required.new(
      isolate: false,
      negate:  false,
      matcher: matcher
    )
  end

  # @example An absolute requirement definition with isolation
  #   require "spectus"
  #   require "matchi/eq"
  #
  #   Spectus.must! Matchi::Eq.new("FOO")
  #   # => #<MUST Matchi::Eq("FOO") isolate=true negate=false>
  #
  # @see must
  def self.must!(matcher)
    Requirement::Required.new(
      isolate: true,
      negate:  false,
      matcher: matcher
    )
  end

  # This method mean that the definition is an absolute prohibition of the specification.
  #
  # @example An absolute prohibition definition
  #   require "spectus"
  #   require "matchi/be"
  #
  #   Spectus.must_not Matchi::Be.new(42)
  #   # => #<MUST Matchi::Be(42) isolate=false negate=true>
  #
  # @param matcher [#matches?] The matcher.
  #
  # @return [Requirement::Required] An absolute prohibition level instance.
  def self.must_not(matcher)
    Requirement::Required.new(
      isolate: false,
      negate:  true,
      matcher: matcher
    )
  end

  # @example An absolute prohibition definition with isolation
  #   require "spectus"
  #   require "matchi/be"
  #
  #   Spectus.must_not! Matchi::Be.new(42)
  #   # => #<MUST Matchi::Be(42) isolate=true negate=true>
  #
  # @see must_not
  def self.must_not!(matcher)
    Requirement::Required.new(
      isolate: true,
      negate:  true,
      matcher: matcher
    )
  end

  # This method mean that there may exist valid reasons in particular
  # circumstances to ignore a particular item, but the full implications must be
  # understood and carefully weighed before choosing a different course.
  #
  # @example A recommended definition
  #   require "spectus"
  #   require "matchi/be"
  #
  #   Spectus.should Matchi::Be.new(true)
  #   # => #<SHOULD Matchi::Be(true) isolate=false negate=false>
  #
  # @param matcher [#matches?] The matcher.
  #
  # @return [Requirement::Recommended] A recommended requirement level instance.
  def self.should(matcher)
    Requirement::Recommended.new(
      isolate: false,
      negate:  false,
      matcher: matcher
    )
  end

  # @example A recommended definition with isolation
  #   require "spectus"
  #   require "matchi/be"
  #
  #   Spectus.should! Matchi::Be.new(true)
  #   # => #<SHOULD Matchi::Be(true) isolate=true negate=false>
  #
  # @see should
  def self.should!(matcher)
    Requirement::Recommended.new(
      isolate: true,
      negate:  false,
      matcher: matcher
    )
  end

  # This method mean that there may exist valid reasons in particular
  # circumstances when the particular behavior is acceptable or even useful, but
  # the full implications should be understood and the case carefully weighed
  # before implementing any behavior described with this label.
  #
  # @example A not recommended definition
  #   require "spectus"
  #   require "matchi/raise_exception"
  #
  #   Spectus.should_not Matchi::RaiseException.new(NoMethodError)
  #   # => #<SHOULD Matchi::RaiseException(NoMethodError) isolate=false negate=true>
  #
  # @param matcher [#matches?] The matcher.
  #
  # @return [Requirement::Recommended] A not recommended requirement level
  #   instance.
  def self.should_not(matcher)
    Requirement::Recommended.new(
      isolate: false,
      negate:  true,
      matcher: matcher
    )
  end

  # @example A not recommended definition with isolation
  #   require "spectus"
  #   require "matchi/raise_exception"
  #
  #   Spectus.should_not! Matchi::RaiseException.new(NoMethodError)
  #   # => #<SHOULD Matchi::RaiseException(NoMethodError) isolate=true negate=true>
  #
  # @see should_not
  def self.should_not!(matcher)
    Requirement::Recommended.new(
      isolate: true,
      negate:  true,
      matcher: matcher
    )
  end

  # This method mean that an item is truly optional.
  # One vendor may choose to include the item because a particular marketplace
  # requires it or because the vendor feels that it enhances the product while
  # another vendor may omit the same item. An implementation which does not
  # include a particular option must be prepared to interoperate with another
  # implementation which does include the option, though perhaps with reduced
  # functionality. In the same vein an implementation which does include a
  # particular option must be prepared to interoperate with another
  # implementation which does not include the option (except, of course, for the
  # feature the option provides).
  #
  # @example An optional definition
  #   require "spectus"
  #   require "matchi/match"
  #
  #   Spectus.may Matchi::Match.new(/^foo$/)
  #   # => #<MAY Matchi::Match(/^foo$/) isolate=false negate=false>
  #
  # @param matcher [#matches?] The matcher.
  #
  # @return [Requirement::Optional] An optional requirement level instance.
  def self.may(matcher)
    Requirement::Optional.new(
      isolate: false,
      negate:  false,
      matcher: matcher
    )
  end

  # @example An optional definition with isolation
  #   require "spectus"
  #   require "matchi/match"
  #
  #   Spectus.may! Matchi::Match.new(/^foo$/)
  #   # => #<MAY Matchi::Match(/^foo$/) isolate=true negate=false>
  #
  # @see may
  def self.may!(matcher)
    Requirement::Optional.new(
      isolate: true,
      negate:  false,
      matcher: matcher
    )
  end
end
