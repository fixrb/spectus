# frozen_string_literal: true

require_relative 'must'

module Spectus
  module RequirementLevel
    # Should requirement level's class.
    class Should < Must
      # Evaluate the expectation.
      #
      # @return [Boolean] Report if the medium expectation pass or fail?
      def pass?
        super || exam.exception.nil?
      end
    end
  end
end
