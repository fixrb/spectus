module Spectus
  # This module provides matchers to define expectations.
  module Matcher
    # Evaluate the expectation with the passed block.
    #
    # @param [Boolean] negated
    # @param [Hash] definition
    #
    # @return [Boolean] Report if the expectation is true or false.
    def self.pass?(negated, definition, &actual)
      params        = Array(definition).flatten 1
      name          = params.first
      expected_args = params[1..-1]
      matcher       = Matcher.get(name).new(*expected_args)

      negated ^ matcher.matches?(&actual)
    end

    # Get the class of a matcher from its symbol.
    #
    # @example
    #
    #   Matcher.get(:eql) # => Eql
    def self.get(name)
      const_get name.to_s.split('_').map(&:capitalize).join.to_sym
    end
  end
end

Dir[File.join File.dirname(__FILE__), 'matcher', '*.rb'].each do |filename|
  require_relative filename
end
