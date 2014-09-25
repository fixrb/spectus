require_relative 'expectation_target'

module Spectus

  # Expectation's domain-specific language.
  module DSL

    # Expectations are built with this method.
    #
    # @api public
    #
    # @example Duck example
    #   YARD.parse('example/duck/*.rb')
    #
    # @return [ExpectationTarget] the expectation target.
    def expect &input
      ExpectationTarget.new(&input)
    end
  end
end
