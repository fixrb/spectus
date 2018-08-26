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
    # @param state   [Sandbox]   The sandbox that tested the code.
    # @param result  [Boolean]   The result of the test.
    def initialize(matcher, negate, state, result)
      @matcher = matcher
      @negate  = negate
      @state   = state
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

    # @!attribute [r] state
    #
    # @return [Sandbox] The sandbox that tested the code.
    attr_reader :state

    # @!attribute [r] result
    #
    # @return [Boolean] The result of the test.
    attr_reader :result

    # The message.
    #
    # @return [String] The message that describe the state.
    def to_s
      "#{title}: #{summary}#{maybe_exception}."
    end

    # The title of the state.
    #
    # @return [String] The title of the state.
    def title
      if result
        state.got ? 'Pass' : 'Info'
      else
        state.exception.nil? ? 'Failure' : 'Error'
      end
    end

    # The summary of the state.
    #
    # @return [String] The summary of the state.
    def summary
      return state.exception.message unless state.valid? || state.exception.nil?

      "Expected #{state.actual.inspect}#{maybe_negate} to #{definition}"
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
      state.exception.nil? ? '' : " (#{state.exception.class})"
    end

    # The readable definition.
    #
    # @return [String] The readable definition string.
    def definition
      matcher.to_s
    end
  end
end
