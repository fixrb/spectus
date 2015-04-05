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
      # @param [Array, Hash, Symbol] definition
      # @param [Boolean] negate
      def initialize(definition, negate, subject, challenge, *context)
        @definition = definition
        @negate     = negate
        @subject    = subject
        @challenge  = challenge
        @context    = context
      end

      protected

      # @param [Sandbox] state The sandbox that tested the code.
      #
      # @return [Result::Pass] pass the spec.
      def pass!(state)
        Result::Pass.new('passing spec', *result_signature(state))
      end

      # @param [Sandbox] state The sandbox that tested the code.
      #
      # @return [Result::Fail] fail the spec.
      def fail!(state)
        fail(Result::Fail.new('failing spec', *result_signature(state)))
      end

      # @param [Sandbox] state The sandbox that tested the code.
      #
      # @return [Array] list of parameters.
      def result_signature(state)
        [
          @subject,
          @challenge,
          @context,
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

      # Run the actual block against the definition.
      #
      # @yieldparam actual the value which is compared with the expected value.
      #
      # @return [Boolean] report if the expectation is true or false.
      def sandbox
        Sandbox.new(@definition, @negate, @subject, @challenge, *@context)
      end
    end
  end
end
