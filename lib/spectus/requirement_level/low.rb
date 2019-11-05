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
      # @return [Boolean] Report if the low expectation pass or fail?
      def pass?
        exam.valid? || exam.exception.class.equal?(::NoMethodError)
      end
    end
  end
end
