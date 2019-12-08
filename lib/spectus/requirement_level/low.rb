# frozen_string_literal: true

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
      # @return [Result::Fail, Result::Pass] Report if the low expectation
      #   pass or fail.
      def result(isolation = false)
        state = sandbox(isolation)

        if state.valid? || state.exception.is_a?(::NoMethodError)
          pass!(state)
        else
          fail!(state)
        end
      end
    end
  end
end