# frozen_string_literal: true

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
      def result(isolation = false)
        state = sandbox(isolation)

        if state.valid?
          pass!(state)
        else
          fail!(state)
        end
      end
    end
  end
end
