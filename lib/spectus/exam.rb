# frozen_string_literal: true

module Spectus
  # This class evaluate the expectation with the passed block.
  #
  # @api private
  #
  class Exam
    # Execute the untested code from the passed block against the matcher.
    #
    # @param matcher    [#matches?]   The matcher.
    # @param negate     [Boolean]     Evaluate to a negative assertion.
    # @param actual     [#object_id]  The actual value.
    # @param exception  [#exception]  An exception.
    def initialize(matcher, negate, actual, exception)
      @actual = actual
      @exception = exception

      return unless exception.nil?

      @got = negate ^ matcher.matches? { actual }
    end

    # @!attribute [r] got
    #
    # @return [#object_id] The result of the boolean comparison between the
    #   actual value and the expected value.
    attr_reader :got

    # @!attribute [r] actual
    #
    # @return [#object_id] The actual value
    attr_reader :actual

    # @!attribute [r] exception
    #
    # @return [#exception] The raised exception
    attr_reader :exception

    # Report to the spec's requirement level if the test is true or false.
    #
    # @return [Boolean] Report if the test was true or false.
    def valid?
      !@exception.nil? ? false : @got
    end
  end
end
