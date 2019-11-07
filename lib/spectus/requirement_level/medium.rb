# frozen_string_literal: true

require_relative 'high'

module Spectus
  module RequirementLevel
    # Medium requirement level's class.
    #
    # @api private
    #
    class Medium < High
      # Evaluate the expectation.
      #
      # @return [Boolean] Report if the medium expectation pass or fail?
      def pass?
        super || exam.exception.nil?
      end
    end
  end
end
