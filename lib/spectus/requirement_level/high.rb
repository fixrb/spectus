require_relative File.join '..', 'sandbox'

module Spectus
  # Contains requirement levels.
  #
  module RequirementLevel
    # _High_ requirement level.
    #
    class High < BasicObject
      # Initialize the requirement level class.
      #
      # @param [Hash] definition
      # @param [Boolean] negate
      def initialize(definition, negate = false)
        @definition = definition
        @negate     = negate
      end

      # Evaluate the expectation with the passed block.
      #
      # @return [Boolean] report if the expectation is true or false.
      def pass?(&actual)
        sandbox(&actual).pass?(@negate)
      end

      protected

      # Run the actual block against the definition.
      #
      # @return [Boolean] report if the expectation is true or false.
      def sandbox(&actual)
        Sandbox.new(@definition, &actual)
      end
    end
  end
end
