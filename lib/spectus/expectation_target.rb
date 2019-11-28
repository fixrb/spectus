# frozen_string_literal: true

require 'defi'

module Spectus
  # Wraps the target of an expectation.
  #
  # @api public
  #
  # @example
  #   it { actual value } # => ExpectationTarget wrapping the block
  class ExpectationTarget
    # Create a new expection target
    #
    # @api private
    #
    # @param subject [Proc] The value which is compared with the expected value.
    def initialize(&subject)
      @subject = subject
    end

    # rubocop:disable Naming/MethodName

    # @api public
    #
    # This word, or the terms "REQUIRED" or "SHALL", mean that the
    # definition is an absolute requirement of the specification.
    #
    # @example _Absolute requirement_ definition
    #   it { 'foo'.upcase }.MUST eql 'FOO'
    #
    # @param matcher [#matches?] The matcher.
    #
    # @return [Result::Fail, Result::Pass] Report if the spec pass or fail.
    def MUST(matcher)
      RequirementLevel::Must.new(
        is_isolation: false,
        is_negate:    false,
        matcher:      matcher,
        subject:      @subject
      ).call
    end

    # @example _Absolute requirement_ definition with isolation
    #   it { 'foo'.upcase }.MUST! eql 'FOO'
    #
    # @see MUST
    def MUST!(matcher)
      RequirementLevel::Must.new(
        is_isolation: true,
        is_negate:    false,
        matcher:      matcher,
        subject:      @subject
      ).call
    end

    # This phrase, or the phrase "SHALL NOT", mean that the
    # definition is an absolute prohibition of the specification.
    #
    # @example _Absolute prohibition_ definition
    #   it { 'foo'.size }.MUST_NOT equal 42
    #
    # @param matcher [#matches?] The matcher.
    #
    # @return [Result::Fail, Result::Pass] Report if the spec pass or fail.
    def MUST_NOT(matcher)
      RequirementLevel::Must.new(
        is_isolation: false,
        is_negate:    true,
        matcher:      matcher,
        subject:      @subject
      ).call
    end

    # @example _Absolute prohibition_ definition with isolation
    #   it { 'foo'.size }.MUST_NOT! equal 42
    #
    # @see MUST_NOT
    def MUST_NOT!(matcher)
      RequirementLevel::Must.new(
        is_isolation: true,
        is_negate:    true,
        matcher:      matcher,
        subject:      @subject
      ).call
    end

    # This word, or the adjective "RECOMMENDED", mean that there
    # may exist valid reasons in particular circumstances to ignore a
    # particular item, but the full implications must be understood and
    # carefully weighed before choosing a different course.
    #
    # @example _Recommended_ definition
    #   it { 'foo'.valid_encoding? }.SHOULD equal true
    #
    # @param matcher [#matches?] The matcher.
    #
    # @return [Result::Fail, Result::Pass] Report if the spec pass or fail.
    def SHOULD(matcher)
      RequirementLevel::Should.new(
        is_isolation: false,
        is_negate:    false,
        matcher:      matcher,
        subject:      @subject
      ).call
    end

    # @example _Recommended_ definition with isolation
    #   it { 'foo'.valid_encoding? }.SHOULD! equal true
    #
    # @see SHOULD
    def SHOULD!(matcher)
      RequirementLevel::Should.new(
        is_isolation: true,
        is_negate:    false,
        matcher:      matcher,
        subject:      @subject
      ).call
    end

    # This phrase, or the phrase "NOT RECOMMENDED" mean that
    # there may exist valid reasons in particular circumstances when the
    # particular behavior is acceptable or even useful, but the full
    # implications should be understood and the case carefully weighed
    # before implementing any behavior described with this label.
    #
    # @example _Not recommended_ definition
    #   it { ''.blank? }.SHOULD_NOT raise_exception NoMethodError
    #
    # @param matcher [#matches?] The matcher.
    #
    # @return [Result::Fail, Result::Pass] Report if the spec pass or fail.
    def SHOULD_NOT(matcher)
      RequirementLevel::Should.new(
        is_isolation: false,
        is_negate:    true,
        matcher:      matcher,
        subject:      @subject
      ).call
    end

    # @example _Not recommended_ definition with isolation
    #   it { ''.blank? }.SHOULD_NOT! raise_exception NoMethodError
    #
    # @see SHOULD_NOT
    def SHOULD_NOT!(matcher)
      RequirementLevel::Should.new(
        is_isolation: true,
        is_negate:    true,
        matcher:      matcher,
        subject:      @subject
      ).call
    end

    # This word, or the adjective "OPTIONAL", mean that an item is
    # truly optional.  One vendor may choose to include the item because a
    # particular marketplace requires it or because the vendor feels that
    # it enhances the product while another vendor may omit the same item.
    # An implementation which does not include a particular option MUST be
    # prepared to interoperate with another implementation which does
    # include the option, though perhaps with reduced functionality. In the
    # same vein an implementation which does include a particular option
    # MUST be prepared to interoperate with another implementation which
    # does not include the option (except, of course, for the feature the
    # option provides.)
    #
    # @example _Optional_ definition
    #   it { 'foo'.bar }.MAY match /^foo$/
    #
    # @param matcher [#matches?] The matcher.
    #
    # @return [Result::Fail, Result::Pass] Report if the spec pass or fail.
    def MAY(matcher)
      RequirementLevel::May.new(
        is_isolation: false,
        is_negate:    false,
        matcher:      matcher,
        subject:      @subject
      ).call
    end

    # @example _Optional_ definition with isolation
    #   it { 'foo'.bar }.MAY! match /^foo$/
    #
    # @see MAY
    def MAY!(matcher)
      RequirementLevel::May.new(
        is_isolation: true,
        is_negate:    false,
        matcher:      matcher,
        subject:      @subject
      ).call
    end

    # rubocop:enable Naming/MethodName
  end
end

require_relative File.join('requirement_level', 'must')
require_relative File.join('requirement_level', 'should')
require_relative File.join('requirement_level', 'may')
