require_relative File.join '..', 'helper_test'

module Spectus
  module Matcher
    class StartWith
      def initialize expected
        @expected = expected
      end

      def matches?
        Regexp.new("^#{@expected}").match(yield) != nil
      end
    end
  end
end
