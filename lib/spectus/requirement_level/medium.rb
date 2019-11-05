# frozen_string_literal: true

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
      # @return [Boolean] Report if the medium expectation pass or fail?
      def pass?
        exam.valid? || exam.exception.nil?
      end
    end
  end
end
