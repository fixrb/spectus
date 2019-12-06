# frozen_string_literal: true

module Spectus
  # Namespace for the requirement levels.
  #
  # @api private
  #
  module RequirementLevel
    # Requirement level's base class.
    #
    class Base
      # Initialize the requirement level class.
      #
      # @param callable   [#call]     The callable object to test.
      # @param isolation  [Boolean]   Compute actual in isolation?
      # @param negate     [Boolean]   Positive or negative assertion?
      # @param matcher    [#matches?] The matcher.
      def initialize(callable:, isolation:, negate:, matcher:)
        @negate   = negate
        @matcher  = matcher

        @exam = Exam.new(
          callable:   callable,
          isolation:  isolation,
          negate:     negate,
          matcher:    matcher
        )
      end

      # @return [#Exam] The exam.
      attr_reader :exam

      # @return [#matches?] The matcher that performed a boolean comparison
      #   between the actual value and the expected value.
      attr_reader :matcher

      # The result of the expectation.
      #
      # @return [Result::Fail, Result::Pass] The test result.
      def call
        pass? ? pass! : fail!
      end

      protected

      # @return [Result::Pass] A passed spec result.
      def pass!
        Result::Pass.new(**details)
      end

      # @raise [Result::Fail] A failed spec result.
      def fail!
        raise Result::Fail.new(**details)
      end

      # @return [Hash] List of parameters.
      def details
        {
          actual:   exam.actual,
          error:    exam.exception,
          expected: matcher.expected,
          got:      exam.got,
          negate:   negate?,
          valid:    exam.valid?,
          matcher:  matcher.class.to_sym,
          level:    level
        }
      end

      # @return [Symbol] The requirement level.
      def level
        self.class.name.split('::').fetch(-1).upcase.to_sym
      end

      # @note The boolean comparison between the actual value and the expected
      #   value can be evaluated to a negative assertion.
      #
      # @return [Boolean] Positive or negative assertion?
      def negate?
        @negate
      end
    end
  end
end

require_relative File.join('..', 'exam')
require_relative File.join('..', 'result', 'fail')
require_relative File.join('..', 'result', 'pass')
