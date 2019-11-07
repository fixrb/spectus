# frozen_string_literal: true

require_relative 'high'

module Spectus
  module RequirementLevel
    # Low requirement level's class.
    #
    # @api private
    #
    class Low < High
      # Evaluate the expectation.
      #
      # @return [Boolean] Report if the low expectation pass or fail?
      def pass?
        super || exam.exception.is_a?(::NoMethodError)
      end
    end
  end
end
