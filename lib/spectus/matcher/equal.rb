module Spectus
  module Matcher

    # Provides the implementation for `equal`.
    class Equal
      def initialize expected
        @expected = expected

        freeze
      end

      # @return [Boolean] Comparison between actual and expected values.
      def matches?
        @expected.equal? yield
      end
    end
  end
end
