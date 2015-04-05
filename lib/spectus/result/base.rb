module Spectus
  module Result
    # Result base's module.
    #
    # @api public
    #
    module Base
      # Initialize the result class.
      #
      # @param [String] message The message describing the actual/error value.
      # @param [#object_id] subject The untrusted object to be tested.
      # @param [Symbol] challenge The method to call on the subject.
      # @param [Array] context Parameters of the challenge.
      # @param [#object_id] actual The value that the subject return through its
      #   challenge.
      # @param [Array, Hash, Symbol] expected The definition of the expected
      #   value.
      # @param [#object_id] got The result of the boolean comparison between the
      #   actual value and the expected value.
      # @param [#exception, nil] error Any possible raised exception.
      # @param [:High, :Medium, :Low] level The level of the expectation.
      # @param [Boolean] negate Evaluate to a negative assertion.
      # @param [Boolean] valid Report if the test was true or false.
      def initialize(message, subject, challenge, context, actual, expected,
                     got, error, level, negate, valid)

        if respond_to?(:exception)
          super(message)
        else
          @message  = message
        end

        @subject    = subject
        @challenge  = challenge
        @context    = context
        @actual     = actual
        @expected   = expected
        @got        = got
        @error      = error
        @level      = level
        @negate     = negate
        @valid      = valid
      end

      attr_reader :subject, :challenge, :context, :actual, :expected, :got,
                  :error, :level

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

      # Report the result.
      #
      # @return [Symbol] the properties of the result.
      def to_h
        {
          subject:    subject,
          challenge:  challenge,
          context:    context,
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
