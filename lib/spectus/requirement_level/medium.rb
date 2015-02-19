require_relative 'high'

module Spectus
  # Contains requirement levels.
  #
  module RequirementLevel
    # _Medium_ requirement level.
    #
    class Medium < High
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
