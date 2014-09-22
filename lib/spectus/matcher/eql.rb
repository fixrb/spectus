module Spectus
  module Matcher

    # @api private
    # Provides the implementation for `eql`.
    class Eql

      # @api private
      def initialize expected
        @expected = expected

        freeze
      end

      # @return [Boolean] Comparison between actual and expected values.
      def matches?
        @expected.eql? yield
      end
    end
  end
end
