require_relative 'base'

module Spectus
  module RequirementLevel
    # High requirement level's class.
    #
    # @api private
    #
    class High < Base
      # Evaluate the expectation.
      #
      # @return [Result::Fail, Result::Pass] Report if the high expectation
      #   pass or fail.
      def result
        state = sandbox

        if state.valid?
          pass!(state)
        else
          fail!(state)
        end
      end
    end
  end
end
