require_relative 'sandbox'

module Spectus
  # Requirement level's base class.
  #
  # @api private
  #
  class Requirement < BasicObject
    # Initialize the requirement level class.
    #
    # @param [Hash] definition
    # @param [Boolean] negate
    def initialize(definition, negate = false)
      @definition = definition
      @negate     = negate
    end

    protected

    # Run the actual block against the definition.
    #
    # @yieldparam actual the value which is compared with the expected value.
    #
    # @return [Boolean] report if the expectation is true or false.
    def sandbox(&actual)
      Sandbox.new(@definition, &actual)
    end
  end
end
