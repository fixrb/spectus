# frozen_string_literal: true

require_relative File.join("result", "fail")
require_relative File.join("result", "pass")

module Spectus
  # Namespace for the results.
  module Result
    # @param is_passed [Boolean] The value of an assertion.
    # @return [Class<Spectus::Result::Pass>, Class<Spectus::Result::Fail>] The
    #   class of the result.
    # @example Get the pass class result.
    #   call(true) # => Pass
    def self.call(is_passed)
      is_passed ? Pass : Fail
    end
  end
end
