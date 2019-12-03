# frozen_string_literal: true

require 'defi'

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
    # @param callable     [#call]     The object to test.
    # @param is_isolation [Boolean]   Compute actual in isolation?
    # @param is_negate    [Boolean]   Positive or negative assertion?
    # @param matcher      [#matches?] The matcher.
    def initialize(callable:, is_isolation:, is_negate:, matcher:)
      @got = is_negate ^ matcher.matches? do
        value = if is_isolation
                  send_call.to!(callable)
                else
                  send_call.to(callable)
                end

        @actual = value.object

        value.call
      end
    rescue ::Exception => e
      @actual     = nil
      @exception  = e
    end
    # rubocop:enable Lint/RescueException

    # @return [#object_id] The actual value.
    attr_reader :actual

    # @return [Exception, nil] An exception.
    attr_reader :exception

    # @return [Boolean, nil] Report to the spec requirement level if the
    #   expectation is true or false.
    attr_reader :got

    # @return [Defi::Challenge] The challenge for the callable object.
    def send_call
      ::Defi.send(:call)
    end

    # Report to the spec requirement level if the test pass or fail.
    #
    # @return [Boolean] Report if the test pass or fail?
    def valid?
      exception.nil? ? got : false
    end
  end
end
