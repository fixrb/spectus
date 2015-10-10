require_relative File.join '..', 'sandbox'
require_relative File.join '..', 'result', 'fail'
require_relative File.join '..', 'result', 'pass'

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

      protected

      # @param state [Sandbox] The sandbox that tested the code.
      #
      # @return [Result::Pass] Pass the spec.
      def pass!(state)
        Result::Pass.new(message(state, true), *result_signature(state))
      end

      # @param state [Sandbox] The sandbox that tested the code.
      #
      # @raise [Result::Fail] Fail the spec.
      def fail!(state)
        fail Result::Fail.new(message(state, false), *result_signature(state)),
             message(state, false), caller[2..-1]
      end

      # @param state [Sandbox] The sandbox that tested the code.
      #
      # @return [Array] List of parameters.
      def result_signature(state)
        [
          @subject,
          state.last_challenge,
          state.actual,
          @req,
          state.got,
          state.exception,
          level,
          @negate,
          state.valid?
        ]
      end

      # @return [Symbol] The requirement level.
      def level
        self.class.name.split('::').last.to_sym
      end

      # @return [Sandbox] The sandbox.
      def sandbox
        if Process.respond_to?(:fork)
          fork_and_return { Sandbox.new(@req, @negate, @subject, *@challenges) }
        else
          Sandbox.new(@req, @negate, @subject, *@challenges)
        end
      end

      # @param state  [Sandbox] The sandbox that tested the code.
      # @param result [Boolean] The result of the test.
      #
      # @return [String] The message that describe the state.
      def message(state, result)
        "#{title(state, result)}: #{summary(state)}."
      end

      # The title of the state.
      #
      # @param state  [Sandbox] The sandbox that tested the code.
      # @param result [Boolean] The result of the test.
      #
      # @return [String] The title of the state.
      def title(state, result)
        if result
          state.got ? 'Pass' : 'Info'
        else
          state.exception.nil? ? 'Failure' : 'Error'
        end
      end

      # The summary of the state.
      #
      # @param state [Sandbox] The sandbox that tested the code.
      #
      # @return [String] The summary of the state.
      def summary(state)
        if state.valid? || state.exception.nil?
          'Expected ' + state.actual.inspect + (@negate ? ' not ' : ' ') +
            'to ' + if @req.is_a?(Hash)
                      readable(@req.keys.first) + ' ' +
                        @req.values.first.inspect
                    else
                      readable(@req)
                    end
        else
          state.exception.message
        end + (state.exception.nil? ? '' : " (#{state.exception.class})")
      end

      # @param st [#to_s] A UpperCamelCase string.
      #
      # @return [String] The snake_case string.
      def readable(st)
        st.to_s
          .gsub(/::/, '/')
          .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
          .gsub(/([a-z\d])([A-Z])/, '\1_\2')
          .tr('-_', ' ')
          .downcase
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
