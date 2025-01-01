# frozen_string_literal: true

require_relative "base"

module Spectus
  module Requirement
    # Implementation of SHOULD/SHOULD NOT requirements from RFC 2119.
    #
    # This level is less strict than MUST requirements. A test at this level
    # passes in two cases:
    # - When the matcher returns the expected result
    # - When no error was raised during the test
    #
    # @example Testing a SHOULD requirement
    #   test = Recommended.new(matcher: some_matcher, negate: false)
    #   test.call { value } # Passes if matcher returns true or no error occurs
    #
    # @example Testing a SHOULD NOT requirement
    #   test = Recommended.new(matcher: some_matcher, negate: true)
    #   test.call { value } # Passes if matcher returns false or no error occurs
    #
    # @see https://www.ietf.org/rfc/rfc2119.txt RFC 2119 SHOULD/SHOULD NOT keywords
    class Recommended < Base
      # The RFC 2119 keyword for this requirement level.
      #
      # @return [Symbol] :SHOULD indicating a recommended requirement
      # @api public
      def self.level
        :SHOULD
      end

      private

      # Determine if the test passed according to SHOULD requirement rules.
      # A test passes if either:
      # - The base matcher validation passes (super)
      # - No error occurred during test execution
      #
      # @param (see Base#passed?)
      # @return (see Base#passed?)
      def passed?(test)
        super || test.error.nil?
      end
    end
  end
end
