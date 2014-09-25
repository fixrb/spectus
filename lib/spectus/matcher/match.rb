module Spectus
  module Matcher

    # Provides the implementation for `match`.
    class Match
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
