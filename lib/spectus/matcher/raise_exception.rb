module Spectus
  module Matcher

    # Provides the implementation for `raise_exception`.
    class RaiseException
      def initialize expected
        @expected = expected

        freeze
      end

      # @return [Boolean] Comparison between actual and expected values.
      def matches?
        begin
          yield
        rescue @expected
          true
        else
          false
        end
      end
    end
  end
end
