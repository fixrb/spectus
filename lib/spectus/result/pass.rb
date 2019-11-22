# frozen_string_literal: true

require_relative 'common'

module Spectus
  module Result
    # The class that is responsible for reporting that the expectation is true.
    class Pass
      include Common

      # Initialize the result Pass class.
      #
      # @param actual     [#object_id] The value that the subject return through
      #   its challenge.
      # @param challenge  [Defi::Challenge] The challenge for the subject.
      # @param error      [Exception, nil] Any possible raised exception.
      # @param expected   [#matches?] The definition of the expected value.
      # @param got        [#object_id] The result of the boolean comparison
      #   between the actual value and the expected value.
      # @param is_negate  [Boolean] Evaluate to a negative assertion?
      # @param is_valid   [Boolean] Report if the test was true or false?
      # @param requirement_level  [:MUST, :SHOULD, :MAY] The expectation.
      # @param subject    [#object_id] The untrusted object to be tested.
      def initialize(actual:, challenge:, error:, expected:, got:, is_negate:,
                     is_valid:, requirement_level:, subject:)

        @actual             = actual
        @challenge          = challenge
        @error              = error
        @expected           = expected
        @got                = got
        @is_negate          = is_negate
        @is_valid           = is_valid
        @requirement_level  = requirement_level
        @subject            = subject
      end

      # The message.
      #
      # @return [String] The message that describe the exam.
      alias message to_s

      # The value of the expectation of the spec.
      #
      # @return [Boolean] The spec passed or failed?
      def pass?
        true
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
        got.nil?
      end

      # The state of warning.
      #
      # @return [Boolean] The test was a warning?
      def warning?
        got.equal?(false)
      end

      # The title of the exam.
      #
      # @return [String] The title of the exam.
      def title
        return 'Success' if success?
        return 'Warning' if warning?

        'Info'
      end

      # Identify the state of the result.
      #
      # @return [Symbol] The identifier of the state.
      def to_sym
        return :success if success?
        return :warning if warning?

        :info
      end

      # Express the result with one char.
      #
      # @param is_color [Boolean] Enable the color?
      #
      # @return [String] The char that identify the result.
      def to_char(is_color: false)
        if success?
          is_color ? "\e[32m.\e[0m" : '.'
        elsif warning?
          is_color ? "\e[36mW\e[0m" : 'W'
        else
          is_color ? "\e[33mI\e[0m" : 'I'
        end
      end

      # The representation of the result.
      #
      # @return [String] A string representing the result.
      def to_s(is_color: false)
        return super unless is_color

        if success?
          "\e[32m#{super}\e[0m"
        elsif warning?
          "\e[36m#{super}\e[0m"
        else
          "\e[33m#{super}\e[0m"
        end
      end
    end
  end
end
