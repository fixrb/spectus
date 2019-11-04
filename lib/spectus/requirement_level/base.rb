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
      # @param matcher    [#matches?]       The matcher.
      # @param negate     [Boolean]         Evaluate to a negative assertion.
      # @param subject    [#object_id]      The subject of the test.
      # @param challenge  [Defi::Challenge] The challenge for the subject.
      # @param isolation  [Boolean]         Compute actual in isolation.
      def initialize(matcher, negate, subject, challenge, isolation)
        unless matcher.respond_to?(:matches?)
          raise NoMethodError, "undefined method `matches?' " \
                               "for #{matcher.inspect}:#{matcher.class}"
        end

        begin
          @actual = if isolation
                      ::Aw.fork! { challenge.to(subject) }
                    else
                      challenge.to(subject)
                    end
        rescue => e
          @exception = e
        end

        @matcher    = matcher
        @negate     = negate
        @subject    = subject
        @challenge  = challenge
        @actual     = actual
        @exception  = exception
        @exam       = execute
      end

      # @!attribute [r] matcher
      #
      # @return [#matches?] The matcher.
      attr_reader :matcher

      # @!attribute [r] subject
      #
      # @return [#object_id] The subject to test.
      attr_reader :subject

      # @!attribute [r] challenge
      #
      # @return [Defi::Challenge] The challenge to test the subject.
      attr_reader :challenge

      # @!attribute [r] actual
      #
      # @return [#object_id] The actual value.
      attr_reader :actual

      # @!attribute [r] exception
      #
      # @return [#exception] The exception value.
      attr_reader :exception

      # @!attribute [r] exam
      #
      # @return [#Exam] The exam.
      attr_reader :exam

      # The value of the negate instance variable.
      #
      # @return [Boolean] Evaluated to a negative assertion or not.
      def negate?
        @negate
      end

      # The result of the expectation.
      #
      # @return [Result::Fail, Result::Pass] A Fail or a Pass instance.
      def result
        pass? ? pass! : fail!
      end

      protected

      # @return [Result::Pass] Pass the spec.
      def pass!
        r = Report.new(matcher, negate?, exam, true)

        Result::Pass.new(r, *result_signature)
      end

      # @raise [Result::Fail] Fail the spec.
      def fail!
        r = Report.new(matcher, negate?, exam, false)

        raise Result::Fail.new(r, *result_signature), r, caller[2..-1]
      end

      # @return [Array] List of parameters.
      def result_signature
        [
          subject,
          challenge,
          actual,
          matcher,
          exam.got,
          exception,
          level,
          negate?,
          exam.valid?
        ]
      end

      # @return [Symbol] The requirement level.
      def level
        self.class.name.split('::').fetch(-1).to_sym
      end

      # @return [Exam] The exam.
      def execute
        Exam.new(matcher, negate?, actual, exception)
      end
    end
  end
end

require_relative File.join('..', 'exam')
require_relative File.join('..', 'report')
require_relative File.join('..', 'result', 'fail')
require_relative File.join('..', 'result', 'pass')
