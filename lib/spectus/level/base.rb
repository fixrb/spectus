require_relative File.join '..', 'sandbox'
require_relative File.join '..', 'result', 'fail'
require_relative File.join '..', 'result', 'pass'

module Spectus
  module RequirementLevel
    # Requirement level's base class.
    #
    # @api private
    #
    class Base
      # Initialize the requirement level class.
      #
      # @param definition [Array, Hash, Symbol] The definition of the expected
      #   value.
      # @param negate     [Boolean] Evaluate to a negative assertion.
      # @param subject    [#object_id] the front object to test.
      # @param challenge  [Challenge] a challenge for the subject.
      def initialize(definition, negate, subject, challenge)
        @definition = definition
        @negate     = negate
        @subject    = subject
        @challenge  = challenge
      end

      protected

      # @param state [Sandbox] The sandbox that tested the code.
      #
      # @return [Result::Pass] pass the spec.
      def pass!(state)
        Result::Pass.new(*result_signature(state))
      end

      # @param state [Sandbox] The sandbox that tested the code.
      #
      # @raise [Result::Fail] fail the spec.
      def fail!(state)
        fail Result::Fail.new(*result_signature(state)), 'failing spec'
      end

      # @param state [Sandbox] The sandbox that tested the code.
      #
      # @return [Array] list of parameters.
      def result_signature(state)
        [
          @subject,
          @challenge.symbol,
          @challenge.args,
          state.actual,
          @definition,
          state.got,
          state.exception,
          level,
          @negate,
          state.valid?
        ]
      end

      # @return [Symbol] the requirement level.
      def level
        self.class.name.split('::').last.to_sym
      end

      # @return [Sandbox] the sandbox.
      def sandbox
        Sandbox.new(@definition, @negate, @subject, @challenge.symbol,
                    *@challenge.args)
      end
    end
  end
end
