require 'matchi'

module Spectus
  # This module provides matchers to define expectations.
  module Matcher
    # Evaluate the expectation with the passed block.
    #
    # @param [Hash, Symbol] definition
    #
    # @return [Boolean] report if the expectation is true or false
    def self.pass?(definition, &actual)
      params        = Array(definition).flatten(1)
      name          = params.first.to_s.split('_').map(&:capitalize).join.to_sym
      expected_args = params[1..-1]
      matcher       = Matchi.const_get(name).new(*expected_args)

      matcher.matches?(&actual)
    end
  end
end
