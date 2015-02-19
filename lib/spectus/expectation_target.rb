require_relative File.join 'requirement_level', 'high'
require_relative File.join 'requirement_level', 'medium'
require_relative File.join 'requirement_level', 'low'

module Spectus
  # Wraps the target of an expectation.
  #
  # @example
  #   this { stuff } # => ExpectationTarget wrapping the block
  class ExpectationTarget < BasicObject
    # Create a new expection target
    #
    # @yieldparam actual the value which is compared with the expected value.
    def initialize(&actual)
      @actual = actual
    end

    # This word, or the terms "REQUIRED" or "SHALL", mean that the
    # definition is an absolute requirement of the specification.
    #
    # @api public
    #
    # @example _Absolute requirement_ definition
    #   this { 'foo'.upcase }.MUST eql: 'FOO' # => true
    #
    # @param [Hash] definition
    #
    # @return [Boolean] report if the expectation is true or false.
    def MUST(definition)
      RequirementLevel::High.new(definition).pass?(&@actual)
    end

    # This phrase, or the phrase "SHALL NOT", mean that the
    # definition is an absolute prohibition of the specification.
    #
    # @api public
    #
    # @example _Absolute prohibition_ definition
    #   this { 'foo'.length }.MUST_NOT equal: 42 # => true
    #
    # @param [Hash] definition
    #
    # @return [Boolean] report if the expectation is true or false.
    def MUST_NOT(definition)
      RequirementLevel::High.new(definition, true).pass?(&@actual)
    end

    # This word, or the adjective "RECOMMENDED", mean that there
    # may exist valid reasons in particular circumstances to ignore a
    # particular item, but the full implications must be understood and
    # carefully weighed before choosing a different course.
    #
    # @api public
    #
    # @example _Recommended_ definition
    #   this { 'foo'.valid_encoding? }.SHOULD equal: true # => true
    #
    # @param [Hash] definition
    #
    # @return [Boolean] report if the expectation is true or false.
    def SHOULD(definition)
      RequirementLevel::Medium.new(definition).pass?(&@actual)
    end

    # This phrase, or the phrase "NOT RECOMMENDED" mean that
    # there may exist valid reasons in particular circumstances when the
    # particular behavior is acceptable or even useful, but the full
    # implications should be understood and the case carefully weighed
    # before implementing any behavior described with this label.
    #
    # @api public
    #
    # @example _Not recommended_ definition
    #   this { ''.blank? }.SHOULD_NOT raise_exception: NoMethodError # => true
    #
    # @param [Hash] definition
    #
    # @return [Boolean] report if the expectation is true or false.
    def SHOULD_NOT(definition)
      RequirementLevel::Medium.new(definition, true).pass?(&@actual)
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
    # @api public
    #
    # @example _Optional_ definition
    #   this { 'foo'.bar }.MAY match: /^foo$/ # => true
    #
    # @param [Hash] definition
    #
    # @return [Boolean] report if the expectation is true or false.
    def MAY(definition)
      RequirementLevel::Low.new(definition).pass?(&@actual)
    end
  end
end
