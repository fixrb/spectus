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
      # @param message    [String] It is describing the actual/error value.
      # @param subject    [#object_id] The untrusted object to be tested.
      # @param challenge  [Challenge] The method to call on the subject.
      # @param actual     [#object_id] The value that the subject return through
      #   its challenge.
      # @param expected   [Array, Hash, Symbol] The definition of the expected
      #   value.
      # @param got        [#object_id] The result of the boolean comparison
      #   between the actual value and the expected value.
      # @param error      [#exception, nil] Any possible raised exception.
      # @param level      [:High, :Medium, :Low] The level of the expectation.
      # @param negate     [Boolean] Evaluate to a negative assertion.
      # @param valid      [Boolean] Report if the test was true or false.
      def initialize(message, subject, challenge, actual, expected, got, error,
        level, negate, valid)

        @message    = message
        @subject    = subject
        @challenge  = challenge
        @actual     = actual
        @expected   = expected
        @got        = got
        @error      = error
        @level      = level
        @negate     = negate
        @valid      = valid
      end

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
      # @return [Array, Hash, Symbol] The definition of the expected value.
      attr_reader :expected

      # @!attribute [r] got
      #
      # @return [#object_id] The result of the boolean comparison between the
      #   actual value and the expected value.
      attr_reader :got

      # @!attribute [r] error
      #
      # @return [#exception, nil] Any possible raised exception.
      attr_reader :error

      # @!attribute [r] level
      #
      # @return [:High, :Medium, :Low] The level of the expectation.
      attr_reader :level

      # The value of the negate instance variable.
      #
      # @return [Boolean] evaluated to a negative assertion or not.
      def negate?
        @negate
      end

      # The value of the boolean comparison between the actual value and the
      # expected value.
      #
      # @return [Boolean] the test was true or false.
      def valid?
        @valid
      end

      # Properties of the result.
      #
      # @return [Hash] the properties of the result.
      def to_h
        {
          subject:    subject,
          challenge:  challenge.to_h,
          actual:     actual,
          expected:   expected,
          got:        got,
          error:      error,
          level:      level,
          negate:     negate?,
          valid:      valid?,
          result:     result?
        }
      end
    end
  end
end
