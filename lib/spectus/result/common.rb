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
      # @return [#object_id] Returned value by the challenged subject.
      attr_reader :actual

      # @return [Exception, nil] Any possible raised exception.
      attr_reader :error

      # @return [#object_id] The expected value.
      attr_reader :expected

      # @return [#object_id] The result of the boolean comparison between the
      #   actual value and the expected value through the matcher.
      attr_reader :got

      # @return [#object_id] The matcher.
      attr_reader :matcher

      # @return [:Must, :Should, :May] The requirement_level of the expectation.
      attr_reader :requirement_level

      # The readable definition.
      #
      # @return [String] A readable string of the definition.
      def definition
        [matcher, expected&.inspect].compact.join(' ')
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
        if error?
          " (#{error.class})"
        elsif actual.is_a?(::Exception)
          " (#{actual.class})"
        else
          ''
        end
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
        return actual.message if actual.is_a?(::Exception)

        if actual == expected
          "expected#{maybe_negate} to #{definition}"
        else
          "expected #{actual.inspect}#{maybe_negate} to #{definition}"
        end
      end

      # The value of the boolean comparison between the actual value and the
      # expected value.
      #
      # @return [Boolean] The test was true or false?
      def valid?
        @is_valid
      end

      # The representation of the result.
      #
      # @return [String] A string representing the result.
      def to_s(**)
        "#{title}: #{summary}#{maybe_exception}."
      end

      # A string containing a human-readable representation of the result.
      #
      # @api public
      #
      # @return [String] The human-readable representation of the result.
      def inspect
        "#{self.class}(actual: #{actual.inspect}, "                       \
                      "error: #{error.inspect}, "                         \
                      "expected: #{expected.inspect}, "                   \
                      "got: #{got.inspect}, "                             \
                      "matcher: #{matcher.inspect}, "                     \
                      "negate: #{negate?.inspect}, "                      \
                      "requirement_level: #{requirement_level.inspect}, " \
                      "valid: #{valid?.inspect})"                         \
      end
    end
  end
end
