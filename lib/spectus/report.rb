# frozen_string_literal: true

module Spectus
  # The class that is responsible for reporting the result of the test.
  #
  # @api private
  #
  class Report
    # Initialize the report class.
    #
    # @param exam     [Exam]    The exam of the code.
    # @param is_pass  [Boolean] The test passed or failed?
    def initialize(exam, is_pass)
      @exam    = exam
      @is_pass = is_pass
    end

    # @!attribute [r] exam
    #
    # @return [Exam] The exam of the code.
    attr_reader :exam

    # The readable definition.
    #
    # @return [String] The readable definition string.
    def definition
      exam.matcher.to_s
    end

    # The type of exception, if any.
    #
    # @return [String] The type of exception, or an empty string.
    def maybe_exception
      exam.exception.nil? ? '' : " (#{exam.exception.class})"
    end

    # The negation, if any.
    #
    # @return [String] The negation, or an empty string.
    def maybe_negate
      exam.negate? ? ' not' : ''
    end

    # The test passed of failed?
    #
    # @return [Boolean] Is the test passed?
    def pass?
      @is_pass
    end

    # The summary of the exam.
    #
    # @return [String] The summary of the exam.
    def summary
      return exam.exception.message unless exam.valid? || exam.exception.nil?

      "Expected #{exam.actual.inspect}#{maybe_negate} to #{definition}"
    end

    # The title of the exam.
    #
    # @return [String] The title of the exam.
    def title
      if pass?
        exam.got ? 'Pass' : 'Info'
      else
        exam.exception.nil? ? 'Failure' : 'Error'
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
