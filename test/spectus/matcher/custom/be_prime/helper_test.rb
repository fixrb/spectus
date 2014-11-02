require_relative File.join '..', 'helper_test'

require 'prime'

module Spectus
  module Matcher
    # This matcher is used to specify that something is a prime number.
    class BePrime
      def matches?
        Prime.prime? yield
      end
    end
  end
end
