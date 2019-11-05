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
    # @param is_negate  [Boolean]     Positive or negative assertion?
    # @param actual     [#object_id]  The actual value.
    # @param exception  [#exception]  An exception.
    def initialize(matcher, is_negate, actual, exception)
      @matcher    = matcher
      @is_negate  = is_negate
      @actual     = actual
      @exception  = exception
      @got        = is_negate ^ matcher.matches? { actual } if exception.nil?
    end

    # @!attribute [r] actual
    #
    # @return [#object_id] The actual value.
    attr_reader :actual

    # @!attribute [r] exception
    #
    # @return [#exception, nil] An exception.
    attr_reader :exception

    # @!attribute [r] got
    #
    # @return [Boolean, nil] Report to the spec requirement level if the
    #   expectation is true or false.
    attr_reader :got

    # @!attribute [r] matcher
    #
    # @return [#matches?] The matcher that performed a boolean comparison
    #   between the actual value and the expected value.
    attr_reader :matcher

    # @return [Boolean] Positive or negative assertion?
    def negate?
      @is_negate
    end

    # Report to the spec requirement level if the test pass or fail.
    #
    # @return [Boolean] Report if the test pass or fail?
    def valid?
      !exception.nil? ? false : got
    end
  end
end
