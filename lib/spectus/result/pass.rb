# frozen_string_literal: true

require_relative 'common'

module Spectus
  module Result
    # The class that is responsible for reporting that the expectation is true.
    class Pass
      include Common

      # Initialize the result Pass class.
      #
      # @param actual     [#object_id] Returned value by the challenged subject.
      # @param error      [Exception, nil] Any possible raised exception.
      # @param expected   [#object_id] The expected value.
      # @param got        [Boolean, nil] The result of the boolean comparison
      #   between the actual value and the expected value through the matcher.
      # @param is_negate  [Boolean] Evaluated to a negative assertion?
      # @param is_valid   [Boolean] Report if the test was true or false?
      # @param matcher    [Symbol] The matcher.
      # @param requirement_level [:MUST, :SHOULD, :MAY] The requirement level.
      def initialize(actual:, error:, expected:, got:, is_negate:,
                     is_valid:, matcher:, requirement_level:)

        @actual             = actual
        @error              = error
        @expected           = expected
        @got                = got
        @is_negate          = is_negate
        @is_valid           = is_valid
        @matcher            = matcher
        @requirement_level  = requirement_level
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
        !error.nil?
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
          is_color ? "\e[33mW\e[0m" : 'W'
        else
          is_color ? "\e[36mI\e[0m" : 'I'
        end
      end

      # The representation of the result.
      #
      # @return [String] A string representing the result.
      def to_s(is_color: false, prefix: nil, subject: nil)
        return super unless is_color

        if success?
          "\e[32m#{super}\e[0m"
        elsif warning?
          "\e[33m#{super}\e[0m"
        else
          "\e[36m#{super}\e[0m"
        end
      end
    end
  end
end
