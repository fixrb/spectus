require_relative File.join '..', 'helper_test'

module Spectus
  module Matcher
    class BeTheAnswer
      def matches?
        42.equal? yield
      end
    end
  end
end
