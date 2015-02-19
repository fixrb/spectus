require_relative File.join '..', 'requirement'

module Spectus
  # Contains requirement levels.
  module RequirementLevel
    # _Medium_ requirement level.
    class Medium < Requirement
      # Evaluate the expectation with the passed block.
      #
      # @return [Boolean] report if the expectation is true or false.
      def pass?(&actual)
        result = sandbox(&actual)

        if result.pass?(@negate)
          true
        else
          result.exception.nil?
        end
      end
    end
  end
end
