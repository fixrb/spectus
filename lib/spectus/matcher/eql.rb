module Spectus
  module Matcher
    # Provides the implementation for `eql`.
    class Eql < BasicObject
      def initialize(expected)
        @expected = expected
      end

      # @return [Boolean] Comparison between actual and expected values.
      def matches?
        @expected.eql?(yield)
      end
    end
  end
end
