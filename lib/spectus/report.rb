# frozen_string_literal: true

module Spectus
  # The class that is responsible for reporting the result of the test.
  #
  # @api private
  #
  class Report
    # Initialize the report class.
    #
    # @param actual     [#object_id]    The actual value.
    # @param exception  [Exception]     An exception.
    # @param expected   [#matches?]     The expected value.
    # @param got        [Boolean, nil]  The boolean comparison result.
    # @param is_negate  [Boolean]       Positive or negative assertion?
    # @param is_pass    [Boolean]       Value of the expectation of the spec.
    # @param is_valid   [Boolean]       The test pass or fail?
    def initialize(actual:, exception:, expected:, got:, is_negate:, is_pass:,
                   is_valid:)

      @actual     = actual
      @exception  = exception
      @expected   = expected
      @got        = got
      @is_negate  = is_negate
      @is_pass    = is_pass
      @is_valid   = is_valid
    end

    # The readable definition.
    #
    # @return [String] The readable definition string.
    def definition
      @expected.to_s
    end

    # The type of exception, if any.
    #
    # @return [String] The type of exception, or an empty string.
    def maybe_exception
      @exception.nil? ? '' : " (#{@exception.class})"
    end

    # The negation, if any.
    #
    # @return [String] The negation, or an empty string.
    def maybe_negate
      @is_negate ? ' not' : ''
    end

    # The summary of the exam.
    #
    # @return [String] The summary of the exam.
    def summary
      return @exception.message unless @is_valid || @exception.nil?

      "Expected #{@actual.inspect}#{maybe_negate} to #{definition}"
    end

    # The title of the exam.
    #
    # @return [String] The title of the exam.
    def title
      if @is_pass
        @got ? 'Pass' : 'Info'
      else
        @exception.nil? ? 'Failure' : 'Error'
      end
    end

    # The message.
    #
    # @return [String] The message that describe the exam.
    def to_s
      "#{title}: #{summary}#{maybe_exception}."
    end
  end
end
