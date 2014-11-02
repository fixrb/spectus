require_relative 'expectation_target'

module Spectus
  # Expectation's domain-specific language.
  module DSL
    # Expectations are built with this method.
    #
    # @api public
    #
    # @example Duck example
    #   expect { 42 }.to equal: 42 # => true
    #
    # @return [ExpectationTarget] the expectation target.
    def expect(&input)
      ExpectationTarget.new(&input)
    end
  end
end
