require 'defi'

module Spectus
  # Wraps the target of an expectation.
  #
  # @api public
  #
  # @example
  #   it { actual value } # => ExpectationTarget wrapping the block
  class ExpectationTarget < BasicObject
    # Create a new expection target
    #
    # @api private
    #
    # @param subject [Proc] The value which is compared with the expected value.
    def initialize(&subject)
      @subject    = subject
      @challenges = [block_challenge]
    end

    # rubocop:disable Style/MethodName

    # @api public
    #
    # This word, or the terms "REQUIRED" or "SHALL", mean that the
    # definition is an absolute requirement of the specification.
    #
    # @example _Absolute requirement_ definition
    #   it { 'foo'.upcase }.MUST eql 'FOO'
    #
    # @param m [#matches?] The matcher.
    #
    # @return [Result::Fail, Result::Pass] Report if the spec pass or fail.
    def MUST(m)
      RequirementLevel::High.new(m, false, subject, *challenges).result
    end

    # @example _Absolute requirement_ definition with isolation
    #   it { 'foo'.upcase }.MUST! eql 'FOO'
    #
    # @see MUST
    def MUST!(m)
      RequirementLevel::High.new(m, false, subject, *challenges).result(true)
    end

    # This phrase, or the phrase "SHALL NOT", mean that the
    # definition is an absolute prohibition of the specification.
    #
    # @example _Absolute prohibition_ definition
    #   it { 'foo'.size }.MUST_NOT equal 42
    #
    # @param m [#matches?] The matcher.
    #
    # @return [Result::Fail, Result::Pass] Report if the spec pass or fail.
    def MUST_NOT(m)
      RequirementLevel::High.new(m, true, subject, *challenges).result
    end

    # @example _Absolute prohibition_ definition with isolation
    #   it { 'foo'.size }.MUST_NOT! equal 42
    #
    # @see MUST_NOT
    def MUST_NOT!(m)
      RequirementLevel::High.new(m, true, subject, *challenges).result(true)
    end

    # This word, or the adjective "RECOMMENDED", mean that there
    # may exist valid reasons in particular circumstances to ignore a
    # particular item, but the full implications must be understood and
    # carefully weighed before choosing a different course.
    #
    # @example _Recommended_ definition
    #   it { 'foo'.valid_encoding? }.SHOULD equal true
    #
    # @param m [#matches?] The matcher.
    #
    # @return [Result::Fail, Result::Pass] Report if the spec pass or fail.
    def SHOULD(m)
      RequirementLevel::Medium.new(m, false, subject, *challenges).result
    end

    # @example _Recommended_ definition with isolation
    #   it { 'foo'.valid_encoding? }.SHOULD! equal true
    #
    # @see SHOULD
    def SHOULD!(m)
      RequirementLevel::Medium.new(m, false, subject, *challenges).result(true)
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
    # @param m [#matches?] The matcher.
    #
    # @return [Result::Fail, Result::Pass] Report if the spec pass or fail.
    def SHOULD_NOT(m)
      RequirementLevel::Medium.new(m, true, subject, *challenges).result
    end

    # @example _Not recommended_ definition with isolation
    #   it { ''.blank? }.SHOULD_NOT! raise_exception NoMethodError
    #
    # @see SHOULD_NOT
    def SHOULD_NOT!(m)
      RequirementLevel::Medium.new(m, true, subject, *challenges).result(true)
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
    # @param m [#matches?] The matcher.
    #
    # @return [Result::Fail, Result::Pass] Report if the spec pass or fail.
    def MAY(m)
      RequirementLevel::Low.new(m, false, subject, *challenges).result
    end

    # @example _Optional_ definition with isolation
    #   it { 'foo'.bar }.MAY! match /^foo$/
    #
    # @see MAY
    def MAY!(m)
      RequirementLevel::Low.new(m, false, subject, *challenges).result(true)
    end

    # @!attribute [r] subject
    #
    # @return [BasicObject] The front object to be tested.
    attr_reader :subject
    private :subject

    # @!attribute [r] challenges
    #
    # @return [Array] The challenges to call on the subject.
    attr_reader :challenges
    private :challenges

    private

    # The first default challenge for blocks.
    #
    # @since 2.10.0
    #
    # @return [Defi] The challenge for blocks.
    def block_challenge
      ::Defi.send(:call)
    end
  end
end

require_relative File.join 'requirement_level', 'high'
require_relative File.join 'requirement_level', 'medium'
require_relative File.join 'requirement_level', 'low'
