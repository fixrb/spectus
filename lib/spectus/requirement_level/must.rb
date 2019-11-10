# frozen_string_literal: true

require_relative 'base'

module Spectus
  module RequirementLevel
    # Must requirement level's class.
    #
    # @api private
    #
    class Must < Base
      # Evaluate the expectation.
      #
      # @return [Boolean] Report if the high expectation pass or fail?
      def pass?
        exam.valid?
      end
    end
  end
end
