# frozen_string_literal: true

module Spectus
  # Namespace for the results.
  module Result
    # Common collection of methods for Result's classes.
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

      # @return [:MUST, :SHOULD, :MAY] The requirement level of the expectation.
      attr_reader :level

      # Common initialize method.
      #
      # @param actual   [#object_id] Returned value by the challenged subject.
      # @param error    [Exception, nil] Any possible raised exception.
      # @param expected [#object_id] The expected value.
      # @param got      [Boolean, nil] The result of the boolean comparison
      #   between the actual value and the expected value through the matcher.
      # @param negate   [Boolean] Evaluated to a negative assertion?
      # @param valid    [Boolean] Report if the test was true or false?
      # @param matcher  [Symbol] The matcher.
      # @param level    [:MUST, :SHOULD, :MAY] The requirement level.
      def initialize(actual:, error:, expected:, got:, negate:, valid:,
                     matcher:, level:)

        @actual   = actual
        @error    = error
        @expected = expected
        @got      = got
        @negate   = negate
        @valid    = valid
        @matcher  = matcher
        @level    = level

        super(to_s) if failed?
      end

      # The value of the negate instance variable.
      #
      # @return [Boolean] Evaluated to a negative assertion?
      def negate?
        @negate
      end

      # The state of error.
      #
      # @return [Boolean] The test raised an error?
      def error?
        !error.nil?
      end

      # The state of success.
      #
      # @return [Boolean] The test was a success?
      def success?
        got.equal?(true)
      end

      # The value of the boolean comparison between the actual value and the
      # expected value.
      #
      # @return [Boolean] The test was true or false?
      def valid?
        @valid
      end

      # A string containing a human-readable representation of the result.
      #
      # @return [String] The human-readable representation of the result.
      def inspect
        "#{self.class}(actual: #{actual.inspect}, "     \
                      "error: #{error.inspect}, "       \
                      "expected: #{expected.inspect}, " \
                      "got: #{got.inspect}, "           \
                      "matcher: #{matcher.inspect}, "   \
                      "negate: #{negate?.inspect}, "    \
                      "level: #{level.inspect}, "       \
                      "valid: #{valid?.inspect})"       \
      end

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

      # The summary of the result.
      #
      # @return [String] A string representing the summary of the result.
      def summary
        if error?
          error.message
        elsif actual.is_a?(::Exception)
          actual.message
        elsif actual == expected
          "expected#{maybe_negate} to #{definition}"
        else
          "expected #{actual.inspect}#{maybe_negate} to #{definition}"
        end
      end

      # Express the result with one colored char.
      #
      # @return [String] The colored char that identify the result.
      def colored_char
        color(char)
      end

      # The colored string representation of the result.
      #
      # @return [String] A string representing the result.
      def colored_string
        color(to_s)
      end

      # The representation of the result.
      #
      # @return [String] A string representing the result.
      def to_s
        "#{titre}: #{summary}."
      end

      # Titre for the result.
      #
      # @return [String] A string representing the titre.
      def titre
        if error?
          error.class.name
        else
          to_sym.to_s.capitalize
        end
      end

      protected

      def color(str)
        if success?
          "\e[32m#{str}\e[0m"
        elsif info?
          "\e[36m#{str}\e[0m"
        elsif warning?
          "\e[33m#{str}\e[0m"
        elsif failure?
          "\e[35m#{str}\e[0m"
        else
          "\e[31m#{str}\e[0m"
        end
      end
    end
  end
end
