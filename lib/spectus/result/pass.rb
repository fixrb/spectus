# frozen_string_literal: true

require_relative 'common'

module Spectus
  module Result
    # The class that is responsible for reporting that the expectation is true.
    class Pass < ::BasicObject
      include Common

      # Initialize the result Pass class.
      #
      # @param subject    [#object_id] The untrusted object to be tested.
      # @param challenge  [Defi::Challenge] The challenge for the subject.
      # @param actual     [#object_id] The value that the subject return through
      #   its challenge.
      # @param expected   [#matches?] The definition of the expected value.
      # @param got        [#object_id] The result of the boolean comparison
      #   between the actual value and the expected value.
      # @param error      [Exception, nil] Any possible raised exception.
      # @param level      [:High, :Medium, :Low] The level of the expectation.
      # @param is_negate  [Boolean] Evaluate to a negative assertion?
      # @param is_valid   [Boolean] Report if the test was true or false?
      def initialize(actual:, challenge:, error:, expected:, got:, is_negate:,
                     is_valid:, level:, subject:)

        @actual     = actual
        @challenge  = challenge
        @error      = error
        @expected   = expected
        @got        = got
        @is_negate  = is_negate
        @is_valid   = is_valid
        @level      = level
        @subject    = subject
      end

      # The value of the expectation of the spec.
      #
      # @return [Boolean] The spec passed or failed?
      def pass?
        true
      end

      # The state of error.
      #
      # @return [Boolean] The test raised an error?
      def error?
        false
      end

      # The state of failure.
      #
      # @return [Boolean] The test was a failure?
      def failure?
        false
      end

      # The state of info.
      #
      # @return [Boolean] The test was an info?
      def info?
        !success?
      end

      # The state of success.
      #
      # @return [Boolean] The test was a success?
      def success?
        got.equal?(true)
      end

      # The message.
      #
      # @return [String] The message that describe the exam.
      alias message to_s

      # The type of exception, if any.
      #
      # @return [String] The type of exception, or an empty string.
      def maybe_exception
        ''
      end

      # The title of the exam.
      #
      # @return [String] The title of the exam.
      def title
        success? ? 'Success' : 'Info'
      end

      # Identify the state of the result.
      #
      # @return [Symbol] The identifier of the state.
      def to_sym
        success? ? :success : :info
      end

      # Express the result with one char.
      #
      # @param is_color [Boolean] Enable the color?
      #
      # @return [String] The char that identify the result.
      def to_char(is_color = false)
        if success?
          is_color ? "\e[32m.\e[0m" : '.'
        else
          is_color ? "\e[33mI\e[0m" : 'I'
        end
      end
    end
  end
end
