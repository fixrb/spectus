# frozen_string_literal: true

require_relative 'common'

module Spectus
  module Result
    # The class that is responsible for reporting that the expectation is false.
    class Fail < ::StandardError
      include Common

      # Initialize the result Fail class.
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

        super(to_s)
      end

      # The value of the expectation of the spec.
      #
      # @return [Boolean] The spec passed or failed?
      def pass?
        false
      end

      # The state of failure.
      #
      # @return [Boolean] The test was a failure?
      def failure?
        !error?
      end

      # The state of info.
      #
      # @return [Boolean] The test was an info?
      def info?
        false
      end

      # The state of warning.
      #
      # @return [Boolean] The test was a warning?
      def warning?
        false
      end

      # The title of the exam.
      #
      # @return [String] The title of the exam.
      def title
        failure? ? 'Failure' : 'Error'
      end

      # Identify the state of the result.
      #
      # @return [Symbol] The identifier of the state.
      def to_sym
        failure? ? :failure : :error
      end

      # Express the result with one char.
      #
      # @param is_color [Boolean] Enable the color?
      #
      # @return [String] The char that identify the result.
      def to_char(is_color: false)
        if failure?
          is_color ? "\e[35mF\e[0m" : 'F'
        else
          is_color ? "\e[31mE\e[0m" : 'E'
        end
      end

      # The representation of the result.
      #
      # @return [String] A string representing the result.
      def to_s(is_color: false)
        return super unless is_color

        if failure?
          "\e[35m#{super}\e[0m"
        else
          "\e[31m#{super}\e[0m"
        end
      end
    end
  end
end
