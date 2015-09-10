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
      # @param definition [Array, Hash, Symbol] The definition of the expected
      #   value.
      # @param negate     [Boolean] Evaluate to a negative assertion.
      # @param subject    [#object_id] the front object to test.
      # @param challenges [Array] a list of challenges for the front object.
      def initialize(definition, negate, subject, *challenges)
        @definition = definition
        @negate     = negate
        @subject    = subject
        @challenges = challenges
      end

      protected

      # @param state [Sandbox] The sandbox that tested the code.
      #
      # @return [Result::Pass] pass the spec.
      def pass!(state)
        Result::Pass.new(message(state, true), *result_signature(state))
      end

      # @param state [Sandbox] The sandbox that tested the code.
      #
      # @raise [Result::Fail] fail the spec.
      def fail!(state)
        fail Result::Fail.new(message(state, false), *result_signature(state)),
             message(state, false), caller[2..-1]
      end

      # @param state [Sandbox] The sandbox that tested the code.
      #
      # @return [Array] list of parameters.
      def result_signature(state)
        [
          @subject,
          state.last_challenge,
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
        Sandbox.new(@definition, @negate, @subject, *@challenges)
      end

      # @param state  [Sandbox] The sandbox that tested the code.
      # @param result [Boolean] The result of the test.
      #
      # @return [String] the message that describe the state.
      def message(state, result)
        "#{title(state, result)}: #{summary(state)}."
      end

      # The title of the state.
      #
      # @param state [Sandbox] The sandbox that tested the code.
      # @param result [Boolean] The result of the test.
      #
      # @return [String] the title of the state.
      def title(state, result)
        if result
          if state.got
            'Pass'
          else
            'Info'
          end
        else
          if state.exception.nil?
            'Failure'
          else
            'Error'
          end
        end
      end

      # The summary of the state.
      #
      # @param state [Sandbox] The sandbox that tested the code.
      #
      # @return [String] the summary of the state.
      def summary(state)
        if state.valid? || state.exception.nil?
          'Expected ' + state.actual.inspect + (@negate ? ' not ' : ' ') +
            'to ' + if @definition.is_a?(Hash)
                      readable(@definition.keys.first.to_s) +
                        " #{@definition.values.first.inspect}"
                    else
                      readable(@definition.to_s)
                    end
        else
          state.exception.message
        end + if state.exception.nil?
                ''
              else
                " (#{state.exception.class})"
              end
      end

      # @param string [String] A UpperCamelCase string.
      #
      # @return [String] the snake_case string.
      def readable(string)
        string.gsub(/::/, '/')
          .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
          .gsub(/([a-z\d])([A-Z])/, '\1_\2')
          .tr('-_', ' ')
          .downcase
      end
    end
  end
end
