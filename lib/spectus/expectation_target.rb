require_relative 'matcher'

module Spectus
  # Wraps the target of an expectation.
  #
  # @example
  #   expect { do_something } # => ExpectationTarget wrapping the block
  class ExpectationTarget < BasicObject
    def initialize(&actual)
      @actual = actual
    end

    # Evaluate to a positive assertion.
    #
    # @api public
    #
    # @see Matcher#pass?
    def to(definition)
      Matcher.pass? false, definition, &@actual
    end

    # Evaluate to a negative assertion.
    #
    # @api public
    #
    # @see Matcher#pass?
    def not_to(definition)
      Matcher.pass? true, definition, &@actual
    end
  end
end
