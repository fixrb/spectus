# frozen_string_literal: true

require "test_tube"

require_relative File.join("..", "result")

module Spectus
  # Namespace for the requirement levels.
  module RequirementLevel
    # Requirement level's base class.
    class Base
      # Initialize the requirement level class.
      #
      # @param callable   [#call]     The callable object to test.
      # @param isolation  [Boolean]   Compute actual in isolation?
      # @param negate     [Boolean]   Invert the matcher or not.
      # @param matcher    [#matches?] The matcher.
      def initialize(callable:, isolation:, matcher:, negate:)
        @negate     = negate
        @matcher    = matcher
        @experiment = ::TestTube.invoke(
          callable,
          isolation:  isolation,
          matcher:    matcher,
          negate:     negate
        )
      end

      # @return [TestTube::Base] The experiment.
      attr_reader :experiment

      # @return [#matches?] The matcher that performed a boolean comparison
      #   between the actual value and the expected value.
      attr_reader :matcher

      # The result of the expectation.
      #
      # @raise [Spectus::Result::Fail] The expectation failed.
      # @return [Spectus::Result::Pass] The expectation passed.
      def call
        Result.call(pass?).with(
          actual:   experiment.actual,
          error:    experiment.error,
          expected: matcher.expected,
          got:      experiment.got,
          level:    level,
          matcher:  matcher.class.to_sym,
          negate:   negate?
        )
      end

      protected

      # Some key words for use in RFCs to indicate requirement levels.
      #
      # @return [:MUST, :SHOULD, :MAY] The requirement level.
      def level
        self.class.name.split("::").fetch(-1).upcase.to_sym
      end

      # @note The boolean comparison between the actual value and the expected
      #   value can be evaluated to a negative assertion.
      #
      # @return [Boolean] Invert the matcher or not.
      def negate?
        @negate
      end
    end
  end
end
