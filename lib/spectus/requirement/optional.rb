# frozen_string_literal: true

require_relative "base"

module Spectus
  module Requirement
    # Implementation of MAY requirements from RFC 2119.
    #
    # This level represents optional features. A test at this level
    # passes in two cases:
    # - When the feature is implemented and the matcher returns true
    # - When NoMethodError is raised, indicating the feature is not implemented
    #
    # @example Testing a MAY requirement with implemented feature
    #   test = Optional.new(matcher: some_matcher, negate: false)
    #   test.call { implemented_feature } # Passes if matcher returns true
    #
    # @example Testing a MAY requirement with unimplemented feature
    #   test = Optional.new(matcher: some_matcher, negate: false)
    #   test.call { unimplemented_feature } # Passes if NoMethodError is raised
    #
    # @see https://www.ietf.org/rfc/rfc2119.txt RFC 2119 MAY keyword
    class Optional < Base
      # The RFC 2119 keyword for this requirement level.
      #
      # @return [Symbol] :MAY indicating an optional requirement
      # @api public
      def self.level
        :MAY
      end

      private

      # Determine if the test passed according to MAY requirement rules.
      # A test passes if either:
      # - The base matcher validation passes (super)
      # - The feature is not implemented (NoMethodError)
      #
      # @param (see Base#passed?)
      # @return (see Base#passed?)
      def passed?(test)
        super || test.error.is_a?(::NoMethodError)
      end
    end
  end
end
