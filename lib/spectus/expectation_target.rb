require_relative 'matcher'

module Spectus

  # Wraps the target of an expectation.
  #
  # @example
  #   expect { do_something } # => ExpectationTarget wrapping the block
  class ExpectationTarget
    # @api private
    def initialize &actual
      @actual = actual

      freeze
    end

    # To evaluate to a positive assertion.
    def to definition
      Matcher.eval false, definition, &@actual
    end

    # To evaluate to a negative assertion.
    def not_to definition
      Matcher.eval true, definition, &@actual
    end
  end
end
