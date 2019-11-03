# frozen_string_literal: true

module Spectus
  # This class evaluate the expectation with the passed block.
  #
  # @api private
  #
  class Sandbox
    # rubocop:disable Style/RescueStandardError

    # Execute the untested code from the passed block against the matcher.
    #
    # @param matcher    [#matches?]       The matcher.
    # @param negate     [Boolean]         Evaluate to a negative assertion.
    # @param subject    [#object_id]      The subject of the test.
    # @param challenge  [Defi::Challenge] The challenge for the subject.
    def initialize(matcher, negate, subject, challenge)
      @got = negate ^ matcher.matches? { @actual = challenge.to(subject) }
    rescue => e
      @exception = e
    end

    # rubocop:enable Style/RescueStandardError

    # @!attribute [r] actual
    #
    # @return [#object_id] The value that the subject return through its
    #   challenge.
    attr_reader :actual

    # @!attribute [r] exception
    #
    # @return [#exception, nil] Any possible raised exception.
    attr_reader :exception

    # @!attribute [r] got
    #
    # @return [#object_id] The result of the boolean comparison between the
    #   actual value and the expected value.
    attr_reader :got

    # Report to the spec's requirement level if the test is true or false.
    #
    # @return [Boolean] Report if the test was true or false.
    def valid?
      defined?(@exception) ? false : got
    end
  end
end
