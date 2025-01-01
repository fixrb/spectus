# frozen_string_literal: true

require_relative "base"

module Spectus
  module Requirement
    # Implementation of MUST/MUST NOT requirements from RFC 2119.
    #
    # This level represents an absolute requirement - tests at this level
    # must pass without any exceptions or conditions. Unlike SHOULD or MAY levels,
    # there is no flexibility in what constitutes a passing test.
    #
    # The test passes only when:
    # - MUST: The matcher returns true (when negate: false)
    # - MUST NOT: The matcher returns false (when negate: true)
    #
    # @example Testing a MUST requirement
    #   test = Required.new(matcher: some_matcher, negate: false)
    #   test.call { value } # Passes only if matcher returns true
    #
    # @example Testing a MUST NOT requirement
    #   test = Required.new(matcher: some_matcher, negate: true)
    #   test.call { value } # Passes only if matcher returns false
    #
    # @see https://www.ietf.org/rfc/rfc2119.txt RFC 2119 MUST/MUST NOT keywords
    class Required < Base
      # The RFC 2119 keyword for this requirement level.
      #
      # @return [Symbol] :MUST indicating an absolute requirement
      # @api public
      def self.level
        :MUST
      end
    end
  end
end
