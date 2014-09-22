module Spectus
  module Matcher

    # @api private
    # Provides the implementation for `equal`.
    class Equal

      # @api private
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
