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
      def initialize(matcher, negate, subject, challenge)
        unless matcher.respond_to?(:matches?)
          raise NoMethodError, "undefined method `matches?' " \
                               "for #{matcher.inspect}:#{matcher.class}"
        end

        @matcher    = matcher
        @negate     = negate
        @subject    = subject
        @challenge  = challenge
      end

      # @!attribute [r] matcher
      #
      # @return [#matches?] The matcher.
      attr_reader :matcher

      # The value of the negate instance variable.
      #
      # @return [Boolean] Evaluated to a negative assertion or not.
      def negate?
        @negate
      end

      # @!attribute [r] subject
      #
      # @return [#object_id] The subject to test.
      attr_reader :subject

      # @!attribute [r] challenge
      #
      # @return [Array] The challenge to test the subject.
      attr_reader :challenge

      protected

      # @param state [Sandbox] The sandbox that tested the code.
      #
      # @return [Result::Pass] Pass the spec.
      def pass!(state)
        r = Report.new(matcher, negate?, state, true)

        Result::Pass.new(r, *result_signature(state))
      end

      # @param state [Sandbox] The sandbox that tested the code.
      #
      # @raise [Result::Fail] Fail the spec.
      def fail!(state)
        r = Report.new(matcher, negate?, state, false)

        raise Result::Fail.new(r, *result_signature(state)), r, caller[2..-1]
      end

      # @param state [Sandbox] The sandbox that tested the code.
      #
      # @return [Array] List of parameters.
      def result_signature(state)
        [
          subject,
          challenge,
          state.actual,
          matcher,
          state.got,
          state.exception,
          level,
          negate?,
          state.valid?
        ]
      end

      # @return [Symbol] The requirement level.
      def level
        self.class.name.split('::').fetch(-1).to_sym
      end

      # @param isolation [Boolean] Test in isolation.
      #
      # @return [Sandbox] The sandbox.
      def sandbox(isolation)
        isolation ? ::Aw.fork! { execute } : execute
      end

      # @return [Sandbox] The sandbox.
      def execute
        Sandbox.new(matcher, negate?, subject, challenge)
      end
    end
  end
end

require_relative File.join('..', 'report')
require_relative File.join('..', 'result', 'fail')
require_relative File.join('..', 'result', 'pass')
require_relative File.join('..', 'sandbox')
