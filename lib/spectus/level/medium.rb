require_relative 'base'

module Spectus
  module RequirementLevel
    # Medium requirement level's class.
    #
    # @api private
    #
    class Medium < Base
      # Evaluate the expectation.
      #
      # @return [Result::Fail, Result::Pass] report if the medium expectation
      #   pass or fail.
      def result
        state = sandbox

        if state.valid? || state.exception.nil?
          pass!(state)
        else
          fail!(state)
        end
      end
    end
  end
end
