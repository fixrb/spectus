# frozen_string_literal: true

require 'aw'

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
      # @param challenge    [Defi::Challenge] The challenge for the subject.
      # @param is_isolation [Boolean]         Compute actual in isolation?
      # @param is_negate    [Boolean]         Positive or negative assertion?
      # @param matcher      [#matches?]       The matcher.
      # @param subject      [#object_id]      The subject of the test.
      def initialize(challenge:, is_isolation:, is_negate:, matcher:, subject:)
        unless matcher.respond_to?(:matches?)
          raise ::NoMethodError, "undefined method `matches?' " \
                                 "for #{matcher.inspect}:#{matcher.class}"
        end

        @challenge  = challenge
        @is_negate  = is_negate
        @matcher    = matcher
        @subject    = subject
        @exam       = Exam.new(
          challenge:    challenge,
          is_isolation: is_isolation,
          is_negate:    is_negate,
          matcher:      matcher,
          subject:      subject
        )
      end

      # @!attribute [r] challenge
      #
      # @return [Defi::Challenge] The challenge to test the subject.
      attr_reader :challenge

      # @!attribute [r] exam
      #
      # @return [#Exam] The exam.
      attr_reader :exam

      # @!attribute [r] matcher
      #
      # @return [#matches?] The matcher that performed a boolean comparison
      #   between the actual value and the expected value.
      attr_reader :matcher

      # @!attribute [r] subject
      #
      # @return [#object_id] The subject to test.
      attr_reader :subject

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
        exception = Result::Fail.new(**details)
        raise exception, exception.message, caller[2..-1]
      end

      # @return [Hash] List of parameters.
      def details
        {
          actual:             exam.actual,
          challenge:          challenge,
          error:              exam.exception,
          expected:           matcher,
          got:                exam.got,
          is_negate:          negate?,
          is_valid:           exam.valid?,
          requirement_level:  requirement_level,
          subject:            subject
        }
      end

      # @return [Symbol] The requirement level.
      def requirement_level
        self.class.name.split('::').fetch(-1).upcase.to_sym
      end

      # @note The boolean comparison between the actual value and the expected
      #   value can be evaluated to a negative assertion.
      #
      # @return [Boolean] Positive or negative assertion?
      def negate?
        @is_negate
      end
    end
  end
end

require_relative File.join('..', 'exam')
require_relative File.join('..', 'result', 'fail')
require_relative File.join('..', 'result', 'pass')
