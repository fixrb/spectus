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
      # @param matcher      [#matches?]       The matcher.
      # @param is_negate    [Boolean]         Positive or negative assertion?
      # @param subject      [#object_id]      The subject of the test.
      # @param challenge    [Defi::Challenge] The challenge for the subject.
      # @param is_isolation [Boolean]         Compute actual in isolation?
      def initialize(matcher, is_negate, subject, challenge, is_isolation)
        unless matcher.respond_to?(:matches?)
          raise ::NoMethodError, "undefined method `matches?' " \
                                 "for #{matcher.inspect}:#{matcher.class}"
        end

        # rubocop:disable Lint/HandleExceptions
        # rubocop:disable Lint/RescueException
        begin
          actual = if is_isolation
                     ::Aw.fork! { challenge.to(subject) }
                   else
                     challenge.to(subject)
                   end
        rescue ::Exception => e
        end
        # rubocop:enable Lint/HandleExceptions
        # rubocop:enable Lint/RescueException

        @subject    = subject
        @challenge  = challenge
        @exam       = Exam.new(matcher, is_negate, actual, e)
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
      # @return [Result::Fail, Result::Pass] A Fail or a Pass instance.
      def result
        pass? ? pass! : fail!
      end

      protected

      # @return [Result::Pass] Pass the spec.
      def pass!
        r = Report.new(exam, true)

        Result::Pass.new(r, *result_signature)
      end

      # @raise [Result::Fail] Fail the spec.
      def fail!
        r = Report.new(exam, false)

        raise Result::Fail.new(r, *result_signature), r, caller[2..-1]
      end

      # @return [Array] List of parameters.
      def result_signature
        [
          subject,
          challenge,
          exam.actual,
          exam.matcher,
          exam.got,
          exam.exception,
          level,
          exam.negate?,
          exam.valid?
        ]
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
