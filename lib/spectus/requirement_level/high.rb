require_relative File.join '..', 'requirement'

module Spectus
  # Contains requirement levels.
  module RequirementLevel
    # _High_ requirement level.
    class High < Requirement
      # Evaluate the expectation with the passed block.
      #
      # @return [Boolean] report if the expectation is true or false.
      def pass?(&actual)
        sandbox(&actual).pass?(@negate)
      end
    end
  end
end
