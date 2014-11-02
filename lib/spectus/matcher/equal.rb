module Spectus
  module Matcher
    # Provides the implementation for `equal`.
    class Equal < BasicObject
      def initialize(expected)
        @expected = expected
      end

      # @return [Boolean] Comparison between actual and expected values.
      def matches?
        @expected.equal? yield
      end
    end
  end
end
