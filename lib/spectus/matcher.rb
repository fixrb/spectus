require_relative 'reporter'

module Spectus

  # This module provides matchers to define expectations.
  module Matcher

    # Evaluate the expectation, and report the result.
    def self.eval negated, definition, &actual
      params        = Array(definition).flatten(1)
      name          = params.first
      expected_args = params[1..-1]
      matcher       = Matcher.get(name).new(*expected_args)

      Reporter.new negated, name, *expected_args, begin
        negated ^ matcher.matches?(&actual)
      rescue => e
        e
      end
    end

    # Get the class of a matcher from its symbol.
    #
    # @example
    #
    #   Matcher.get(:eql) # => Eql
    def self.get name
      const_get name.to_s.split('_').map {|w| w.capitalize }.join.to_sym
    end
  end
end

Dir[File.join File.dirname(__FILE__), 'matcher', '*.rb'].each do |filename|
  require_relative filename
end
