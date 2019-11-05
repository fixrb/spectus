# frozen_string_literal: true

module Spectus
  # Namespace for the results.
  #
  # @api private
  #
  module Result
    # Result base's module.
    #
    module Base
      # Initialize the result class.
      #
      # @param subject    [#object_id] The untrusted object to be tested.
      # @param challenge  [Defi::Challenge] The challenge for the subject.
      # @param actual     [#object_id] The value that the subject return through
      #   its challenge.
      # @param expected   [#matches?] The definition of the expected value.
      # @param got        [#object_id] The result of the boolean comparison
      #   between the actual value and the expected value.
      # @param error      [Exception, nil] Any possible raised exception.
      # @param level      [:High, :Medium, :Low] The level of the expectation.
      # @param is_negate  [Boolean] Evaluate to a negative assertion?
      # @param is_valid   [Boolean] Report if the test was true or false?
      def initialize(actual:, challenge:, error:, expected:, got:,
                     is_negate:, is_valid:, level:, subject:)

        @actual     = actual
        @challenge  = challenge
        @error      = error
        @expected   = expected
        @got        = got
        @is_negate  = is_negate
        @is_valid   = is_valid
        @level      = level
        @subject    = subject
        @message    = Report.new(
          actual:     actual,
          exception:  error,
          expected:   expected,
          got:        got,
          is_negate:  is_negate,
          is_pass:    pass?,
          is_valid:   is_valid
        ).to_s
      end

      # @!attribute [r] message
      #
      # @return [String] The message that describe the state.
      attr_reader :message

      # @!attribute [r] subject
      #
      # @return [#object_id] The untrusted object to be tested.
      attr_reader :subject

      # @!attribute [r] challenge
      #
      # @return [Symbol] The method to call on the subject.
      attr_reader :challenge

      # @!attribute [r] actual
      #
      # @return [#object_id] The value that the subject return through its
      #   challenge.
      attr_reader :actual

      # @!attribute [r] expected
      #
      # @return [#matches?] The definition of the expected value.
      attr_reader :expected

      # @!attribute [r] got
      #
      # @return [#object_id] The result of the boolean comparison between the
      #   actual value and the expected value.
      attr_reader :got

      # @!attribute [r] error
      #
      # @return [Exception, nil] Any possible raised exception.
      attr_reader :error

      # @!attribute [r] level
      #
      # @return [:High, :Medium, :Low] The level of the expectation.
      attr_reader :level

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
          subject:    subject,
          challenge:  challenge.to_h,
          actual:     actual,
          expected:   expected.to_h,
          got:        got,
          error:      error,
          level:      level,
          negate:     negate?,
          valid:      valid?,
          result:     pass?
        }
      end
    end
  end
end
