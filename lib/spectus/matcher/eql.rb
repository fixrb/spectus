module Spectus
  module Matcher

    # Provides the implementation for `eql`.
    class Eql
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
