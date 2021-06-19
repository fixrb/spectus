# frozen_string_literal: true

require_relative "must"

module Spectus
  module RequirementLevel
    # May requirement level's class.
    class May < Must
      # Evaluate the expectation.
      #
      # @return [Boolean] Report if the low expectation pass or fail?
      def pass?
        super || experiment.error.is_a?(::NoMethodError)
      end
    end
  end
end
