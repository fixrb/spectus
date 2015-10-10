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
      # @param req        [Hash, Symbol]  The definition of the expected value.
      # @param negate     [Boolean]       Evaluate to a negative assertion.
      # @param subject    [#object_id]    The front object to test.
      # @param challenges [Array]         A list of challenges.
      def initialize(req, negate, subject, *challenges)
        @req        = req
        @negate     = negate
        @subject    = subject
        @challenges = challenges
      end

      # @!attribute [r] req
      #
      # @return [Hash, Symbol] The definition of the expected value.
      attr_reader :req

      # The value of the negate instance variable.
      #
      # @return [Boolean] Evaluated to a negative assertion or not.
      def negate?
        @negate
      end

      # @!attribute [r] subject
      #
      # @return [#object_id] The front object to test.
      attr_reader :subject

      # @!attribute [r] challenges
      #
      # @return [Array] A list of challenges.
      attr_reader :challenges

      protected

      # @param state [Sandbox] The sandbox that tested the code.
      #
      # @return [Result::Pass] Pass the spec.
      def pass!(state)
        msg = Report.new(req, negate?, state, true)

        Result::Pass.new(msg, *result_signature(state))
      end

      # @param state [Sandbox] The sandbox that tested the code.
      #
      # @raise [Result::Fail] Fail the spec.
      def fail!(state)
        msg = Report.new(req, negate?, state, false)

        fail Result::Fail.new(msg, *result_signature(state)), msg, caller[2..-1]
      end

      # @param state [Sandbox] The sandbox that tested the code.
      #
      # @return [Array] List of parameters.
      def result_signature(state)
        [
          subject,
          state.last_challenge,
          state.actual,
          req,
          state.got,
          state.exception,
          level,
          negate?,
          state.valid?
        ]
      end

      # @return [Symbol] The requirement level.
      def level
        self.class.name.split('::').last.to_sym
      end

      # @return [Sandbox] The sandbox.
      def sandbox
        Process.respond_to?(:fork) ? fork_and_return { execute } : execute
      end

      # @return [Sandbox] The sandbox.
      def execute
        Sandbox.new(req, negate?, subject, *challenges)
      end

      # Run the code in a separate process.
      #
      # @yieldreturn [Sandbox] Execute the untested code in the sandbox.
      def fork_and_return
        read, write = IO.pipe

        pid = fork do
          read.close
          result = yield
          Marshal.dump(result, write)
          exit!(0)
        end

        write.close
        result = read.read
        Process.wait(pid)
        Marshal.load(result)
      end
    end
  end
end

require_relative File.join '..', 'report'
require_relative File.join '..', 'result', 'fail'
require_relative File.join '..', 'result', 'pass'
require_relative File.join '..', 'sandbox'
