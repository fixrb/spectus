require_relative File.join '..', 'helper_test'

require 'prime'

module Spectus
  module Matcher
    class BePrime
      def matches?
        Prime.prime? yield
      end
    end
  end
end
