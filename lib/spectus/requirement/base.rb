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
      # @param matcher  [#match?] The matcher.
      # @param negate   [Boolean]   Invert the matcher or not.
      def initialize(matcher:, negate:)
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
      def call(&)
        test = ::TestTube.invoke(matcher: @matcher, negate: @negate, &)

        ::Expresenter.call(passed?(test)).with(
          actual:     test.actual,
          definition: @matcher.to_s,
          error:      test.error,
          got:        test.got,
          level:      self.class.level,
          negate:     @negate
        )
      end

      # :nocov:

      # A string containing a human-readable representation of the definition.
      #
      # @example The human-readable representation of an absolute requirement.
      #   require "spectus"
      #   require "matchi/be"
      #
      #   definition = Spectus.must Matchi::Be.new(1)
      #   definition.inspect
      #   # => "#<MUST Matchi::Be(1) negate=false>"
      #
      # @return [String] The human-readable representation of the definition.
      #
      # @api public
      def inspect
        "#<#{self.class.level} #{@matcher.inspect} negate=#{@negate}>"
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
