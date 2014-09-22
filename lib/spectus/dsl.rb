require_relative 'expectation_target'

module Spectus

  # Expectation's domain-specific language.
  module DSL

    # Expectations are built with this method which takes a value, called the
    # actual.
    def expect &input
      ExpectationTarget.new(&input)
    end
  end
end
