require_relative 'base'

module Spectus
  module RequirementLevel
    # Low requirement level's class.
    #
    # @api private
    #
    class Low < Base
      # Evaluate the expectation.
      #
      # @return [Result::Fail, Result::Pass] report if the low expectation
      #   pass or fail.
      def result
        state = sandbox

        if state.valid? || state.exception.class.equal?(::NoMethodError)
          pass!(state)
        else
          fail!(state)
        end
      end
    end
  end
end
