# frozen_string_literal: true

module Spectus
  # This class evaluate the expectation with the passed block.
  #
  # @api private
  #
  class Exam
    # Execute the untested code from the passed block against the matcher.
    #
    # rubocop:disable Lint/RescueException
    #
    # @param challenge    [Defi::Challenge] The challenge for the subject.
    # @param is_isolation [Boolean]         Compute actual in isolation?
    # @param is_negate    [Boolean]         Positive or negative assertion?
    # @param matcher      [#matches?]       The matcher.
    # @param exception    [Exception]       An exception.
    def initialize(challenge:, is_isolation:, is_negate:, matcher:, subject:)
      @got = is_negate ^ matcher.matches? do
        @actual = if is_isolation
                    ::Aw.fork! { challenge.to(subject) }
                  else
                    challenge.to(subject)
                  end
      end
    rescue ::Exception => e
      @exception = e
    end
    # rubocop:enable Lint/RescueException

    # @!attribute [r] actual
    #
    # @return [#object_id] The actual value.
    attr_reader :actual

    # @!attribute [r] exception
    #
    # @return [Exception, nil] An exception.
    attr_reader :exception

    # @!attribute [r] got
    #
    # @return [Boolean, nil] Report to the spec requirement level if the
    #   expectation is true or false.
    attr_reader :got

    # Report to the spec requirement level if the test pass or fail.
    #
    # @return [Boolean] Report if the test pass or fail?
    def valid?
      exception.nil? ? got : false
    end
  end
end
