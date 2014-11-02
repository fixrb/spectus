module Spectus
  module Matcher
    # Provides the implementation for `raise_exception`.
    class RaiseException < BasicObject
      def initialize(expected)
        @expected = expected
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
