require_relative 'medium'

module Spectus
  # Contains requirement levels.
  #
  module RequirementLevel
    # _Low_ requirement level.
    #
    class Low < Medium
      # Evaluate the expectation with the passed block.
      #
      # @return [Boolean] report if the expectation is true or false.
      def pass?(&actual)
        result = sandbox(&actual)

        if result.exception.class.equal?(::NoMethodError)
          true
        else
          result.pass?(@negate)
        end
      end
    end
  end
end
