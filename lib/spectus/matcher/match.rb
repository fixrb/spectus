module Spectus
  module Matcher

    # Provides the implementation for `match`.
    class Match < BasicObject
      def initialize expected
        @expected = expected
      end

      # @return [Boolean] Comparison between actual and expected values.
      def matches?
        !@expected.match(yield).nil?
      end
    end
  end
end
