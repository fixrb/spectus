# frozen_string_literal: true

require "expresenter"
require "test_tube"

module Spectus
  # Namespace for the requirement levels.
  module Requirement
    # Requirement level's base class.
    class Base
      # Initialize the requirement level class.
      #
      # @param isolate  [Boolean]   Compute actual in a subprocess.
      # @param matcher  [#matches?] The matcher.
      # @param negate   [Boolean]   Invert the matcher or not.
      def initialize(isolate:, matcher:, negate:)
        @isolate  = isolate
        @matcher  = matcher
        @negate   = negate
      end

      # Test result.
      #
      # @raise [::Expresenter::Fail] A failed spec exception.
      # @return [::Expresenter::Pass] A passed spec instance.
      #
      # @see https://github.com/fixrb/expresenter
      #
      # @api public
      def call(&block)
        test = ::TestTube.invoke(isolation: @isolate, matcher: @matcher, negate: @negate, &block)

        ::Expresenter.call(passed?(test)).with(
          actual:   test.actual,
          error:    test.error,
          expected: @matcher.expected,
          got:      test.got,
          level:    self.class.level,
          matcher:  @matcher.class.to_sym,
          negate:   @negate
        )
      end

      # :nocov:

      # A string containing a human-readable representation of the definition.
      #
      # @example The human-readable representation of an absolute requirement.
      #   require "spectus"
      #   require "matchi/helper"
      #
      #   include Matchi::Helper
      #
      #   definition = Spectus.must equal 1
      #   definition.inspect
      #   # => #<MUST Matchi::Matcher::Equal(1) isolate=false negate=false>
      #
      # @return [String] The human-readable representation of the definition.
      #
      # @api public
      def inspect
        "#<#{self.class.level} #{@matcher.inspect} isolate=#{@isolate} negate=#{@negate}>"
      end

      # :nocov:

      private

      # Code experiment result.
      #
      # @param test [::TestTube::Base] The state of the experiment.
      #
      # @see https://github.com/fixrb/test_tube
      #
      # @return [Boolean] The result of the test (passed or failed).
      def passed?(test)
        test.got.equal?(true)
      end
    end
  end
end
