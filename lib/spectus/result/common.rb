# frozen_string_literal: true

module Spectus
  # Namespace for the results.
  #
  # @api private
  #
  module Result
    # Common collection of methods for Result's classes.
    #
    module Common
      # @!attribute [r] actual
      #
      # @return [#object_id] The value that the subject return through its
      #   challenge.
      attr_reader :actual

      # @!attribute [r] challenge
      #
      # @return [Symbol] The method to call on the subject.
      attr_reader :challenge

      # @!attribute [r] error
      #
      # @return [Exception, nil] Any possible raised exception.
      attr_reader :error

      # @!attribute [r] expected
      #
      # @return [#matches?] The definition of the expected value.
      attr_reader :expected

      # @!attribute [r] got
      #
      # @return [#object_id] The result of the boolean comparison between the
      #   actual value and the expected value.
      attr_reader :got

      # @!attribute [r] requirement_level
      #
      # @return [:Must, :Should, :May] The requirement_level of the expectation.
      attr_reader :requirement_level

      # @!attribute [r] subject
      #
      # @return [#object_id] The untrusted object to be tested.
      attr_reader :subject

      # The readable definition.
      #
      # @return [String] A readable string of the definition.
      def definition
        expected.to_s
      end

      # The negation, if any.
      #
      # @return [String] The negation, or an empty string.
      def maybe_negate
        negate? ? ' not' : ''
      end

      # The value of the negate instance variable.
      #
      # @return [Boolean] Evaluated to a negative assertion?
      def negate?
        @is_negate
      end

      # :nocov:

      # @note Abstract method.
      def to_char(*)
        raise ::NotImplementedError
      end

      # @note Abstract method.
      def pass?
        raise ::NotImplementedError
      end

      # @note Abstract method.
      def to_sym
        raise ::NotImplementedError
      end

      # The state of error.
      #
      # @return [Boolean] The test raised an error?
      def error?
        !error.nil?
      end

      # The type of exception, if any.
      #
      # @return [String] The type of exception, or an empty string.
      def maybe_exception
        error? ? " (#{error.class})" : ''
      end

      # The state of success.
      #
      # @return [Boolean] The test was a success?
      def success?
        got.equal?(true)
      end

      # The summary of the result.
      #
      # @return [String] A string representing the summary of the result.
      def summary
        return error.message if error?

        "expected #{actual.inspect}#{maybe_negate} to #{definition}"
      end

      # :nocov:

      # The value of the boolean comparison between the actual value and the
      # expected value.
      #
      # @return [Boolean] The test was true or false?
      def valid?
        @is_valid
      end

      # Properties of the result.
      #
      # @return [Hash] The properties of the result.
      def to_h
        {
          actual:             actual,
          challenge:          challenge.to_h,
          error:              error,
          expected:           expected.to_h,
          got:                got,
          negate:             negate?,
          requirement_level:  requirement_level,
          result:             pass?,
          subject:            subject,
          valid:              valid?
        }
      end

      # The representation of the result.
      #
      # @return [String] A string representing the result.
      def to_s
        "#{title}: #{summary}#{maybe_exception}."
      end
    end
  end
end