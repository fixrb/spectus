# frozen_string_literal: true

module Spectus
  # The class that is responsible for reporting the result of the test.
  #
  # @api private
  #
  class Report
    # Initialize the report class.
    #
    # @param matcher [#matches?] The matcher.
    # @param negate  [Boolean]   Evaluate to a negative assertion.
    # @param exam    [Exam]   The exam of the code.
    # @param result  [Boolean]   The result of the test.
    def initialize(matcher, negate, exam, result)
      @matcher = matcher
      @negate  = negate
      @exam    = exam
      @result  = result
    end

    # @!attribute [r] matcher
    #
    # @return [#matches?] The matcher.
    attr_reader :matcher

    # The value of the negate instance variable.
    #
    # @return [Boolean] Evaluated to a negative assertion or not.
    def negate?
      @negate
    end

    # @!attribute [r] exam
    #
    # @return [Exam] The exam of the code.
    attr_reader :exam

    # @!attribute [r] result
    #
    # @return [Boolean] The result of the test.
    attr_reader :result

    # The message.
    #
    # @return [String] The message that describe the exam.
    def to_s
      "#{title}: #{summary}#{maybe_exception}."
    end

    # The title of the exam.
    #
    # @return [String] The title of the exam.
    def title
      if result
        exam.got ? 'Pass' : 'Info'
      else
        exam.exception.nil? ? 'Failure' : 'Error'
      end
    end

    # The summary of the exam.
    #
    # @return [String] The summary of the exam.
    def summary
      return exam.exception.message unless exam.valid? || exam.exception.nil?

      "Expected #{exam.actual.inspect}#{maybe_negate} to #{definition}"
    end

    # The negation, if any.
    #
    # @return [String] The negation, or an empty string.
    def maybe_negate
      negate? ? ' not' : ''
    end

    # The type of exception, if any.
    #
    # @return [String] The type of exception, or an empty string.
    def maybe_exception
      exam.exception.nil? ? '' : " (#{exam.exception.class})"
    end

    # The readable definition.
    #
    # @return [String] The readable definition string.
    def definition
      matcher.to_s
    end
  end
end
