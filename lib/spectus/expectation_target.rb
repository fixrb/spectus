require_relative 'matcher'

module Spectus

  # Wraps the target of an expectation.
  #
  # @example
  #   expect { do_something } # => ExpectationTarget wrapping the block
  class ExpectationTarget
    def initialize &actual
      @actual = actual

      freeze
    end

    # Evaluate to a positive assertion.
    #
    # @api public
    #
    # @see Matcher#eval
    def to definition
      Matcher.eval false, definition, &@actual
    end

    # Evaluate to a negative assertion.
    #
    # @api public
    #
    # @see Matcher#eval
    def not_to definition
      Matcher.eval true, definition, &@actual
    end
  end
end
