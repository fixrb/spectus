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

        @subject    = subject
        @challenge  = challenge

        # rubocop:disable Lint/HandleExceptions
        # rubocop:disable Lint/RescueException
        begin
          actual = if is_isolation
                     ::Aw.fork! { challenge.to(subject) }
                   else
                     challenge.to(subject)
                   end
        rescue ::Exception => e
          # An exception is catched.
        end
        # rubocop:enable Lint/HandleExceptions
        # rubocop:enable Lint/RescueException

        @exam = Exam.new(
          actual:     actual,
          exception:  e,
          is_negate:  is_negate,
          matcher:    matcher
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
          actual:     exam.actual,
          challenge:  challenge,
          error:      exam.exception,
          expected:   exam.matcher,
          got:        exam.got,
          is_negate:  exam.negate?,
          is_valid:   exam.valid?,
          level:      level,
          subject:    subject
        }
      end

      # @return [Symbol] The requirement level.
      def level
        self.class.name.split('::').fetch(-1).to_sym
      end
    end
  end
end

require_relative File.join('..', 'exam')
require_relative File.join('..', 'report')
require_relative File.join('..', 'result', 'fail')
require_relative File.join('..', 'result', 'pass')
