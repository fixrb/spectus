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
    # @param matcher    [#matches?]  The matcher.
    # @param negate     [Boolean]    The negation of the matcher's result.
    # @param object     [#object_id] The front object which is challenged.
    # @param challenges [Array]      The list of challenges.
    def initialize(matcher, negate, object, *challenges)
      @got = negate ^ matcher.matches? do
        @actual = challenges.inject(object) do |subject, challenge|
          @last_challenge = challenge
          @last_challenge.to(subject)
        end
      end
    rescue => e
      @exception = e
    end

    # rubocop:enable Style/RescueStandardError

    # @!attribute [r] last_challenge
    #
    # @return [Defi::Challenge] The last evaluated challenge.
    attr_reader :last_challenge

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
      if defined?(@exception)
        false
      else
        got
      end
    end
  end
end
