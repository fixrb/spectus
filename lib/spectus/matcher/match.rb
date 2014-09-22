module Spectus
  module Matcher

    # @api private
    # Provides the implementation for `match`.
    class Match

      # @api private
      def initialize expected
        @expected = expected

        freeze
      end

      # @return [Boolean] Comparison between actual and expected values.
      def matches?
        !@expected.match(yield).nil?
      end
    end
  end
end
