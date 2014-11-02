require_relative File.join '..', 'helper_test'

module Spectus
  module Matcher
    # This matcher is used to specify that something equal 42.
    class BeTheAnswer
      def matches?
        42.equal? yield
      end
    end
  end
end
