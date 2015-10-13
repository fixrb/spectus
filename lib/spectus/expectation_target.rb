require 'defi'

module Spectus
  # Wraps the target of an expectation.
  #
  # @example
  #   this { actual value } # => ExpectationTarget wrapping the block
  class ExpectationTarget < BasicObject
    # Create a new expection target
    #
    # @param subject [Proc] The value which is compared with the expected value.
    def initialize(&subject)
      @subject    = subject
      @challenges = [::Defi.send(:call)]
    end

    # @!attribute [r] subject
    #
    # @return [BasicObject] The front object to be tested.
    attr_reader :subject

    # @!attribute [r] challenges
    #
    # @return [Array] The challenges to call on the subject.
    attr_reader :challenges

    # rubocop:disable Style/MethodName

    # This word, or the terms "REQUIRED" or "SHALL", mean that the
    # definition is an absolute requirement of the specification.
    #
    # @example _Absolute requirement_ definition
    #   this { 'foo'.upcase }.MUST Eql: 'FOO'
    #
    # @param req [Array, Hash, Symbol]
    #
    # @return [Result::Fail, Result::Pass] Report if the spec pass or fail.
    def MUST(req)
      RequirementLevel::High.new(req, false, subject, *challenges).result
    end

    # @example _Absolute requirement_ definition with isolation
    #   this { 'foo'.upcase }.MUST! Eql: 'FOO'
    #
    # @see MUST
    def MUST!(req)
      RequirementLevel::High.new(req, false, subject, *challenges).result(true)
    end

    # This phrase, or the phrase "SHALL NOT", mean that the
    # definition is an absolute prohibition of the specification.
    #
    # @example _Absolute prohibition_ definition
    #   this { 'foo'.size }.MUST_NOT Equal: 42
    #
    # @param req [Array, Hash, Symbol]
    #
    # @return [Result::Fail, Result::Pass] Report if the spec pass or fail.
    def MUST_NOT(req)
      RequirementLevel::High.new(req, true, subject, *challenges).result
    end

    # @example _Absolute prohibition_ definition with isolation
    #   this { 'foo'.size }.MUST_NOT! Equal: 42
    #
    # @see MUST_NOT
    def MUST_NOT!(req)
      RequirementLevel::High.new(req, true, subject, *challenges).result(true)
    end

    # This word, or the adjective "RECOMMENDED", mean that there
    # may exist valid reasons in particular circumstances to ignore a
    # particular item, but the full implications must be understood and
    # carefully weighed before choosing a different course.
    #
    # @example _Recommended_ definition
    #   this { 'foo'.valid_encoding? }.SHOULD Equal: true
    #
    # @param req [Array, Hash, Symbol]
    #
    # @return [Result::Fail, Result::Pass] Report if the spec pass or fail.
    def SHOULD(req)
      RequirementLevel::Medium.new(req, false, subject, *challenges).result
    end

    # @example _Recommended_ definition with isolation
    #   this { 'foo'.valid_encoding? }.SHOULD! Equal: true
    #
    # @see SHOULD
    def SHOULD!(req)
      RequirementLevel::Medium.new(req, false, subject, *challenges)
        .result(true)
    end

    # This phrase, or the phrase "NOT RECOMMENDED" mean that
    # there may exist valid reasons in particular circumstances when the
    # particular behavior is acceptable or even useful, but the full
    # implications should be understood and the case carefully weighed
    # before implementing any behavior described with this label.
    #
    # @example _Not recommended_ definition
    #   this { ''.blank? }.SHOULD_NOT RaiseException: NoMethodError
    #
    # @param req [Array, Hash, Symbol]
    #
    # @return [Result::Fail, Result::Pass] Report if the spec pass or fail.
    def SHOULD_NOT(req)
      RequirementLevel::Medium.new(req, true, subject, *challenges).result
    end

    # @example _Not recommended_ definition with isolation
    #   this { ''.blank? }.SHOULD_NOT! RaiseException: NoMethodError
    #
    # @see SHOULD_NOT
    def SHOULD_NOT!(req)
      RequirementLevel::Medium.new(req, true, subject, *challenges).result(true)
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
    #   this { 'foo'.bar }.MAY Match: /^foo$/
    #
    # @param req [Array, Hash, Symbol]
    #
    # @return [Result::Fail, Result::Pass] Report if the spec pass or fail.
    def MAY(req)
      RequirementLevel::Low.new(req, false, subject, *challenges).result
    end

    # @example _Optional_ definition with isolation
    #   this { 'foo'.bar }.MAY! Match: /^foo$/
    #
    # @see MAY
    def MAY!(req)
      RequirementLevel::Low.new(req, false, subject, *challenges).result(true)
    end
  end
end

require_relative File.join 'requirement_level', 'high'
require_relative File.join 'requirement_level', 'medium'
require_relative File.join 'requirement_level', 'low'
