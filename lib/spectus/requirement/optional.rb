# frozen_string_literal: true

require_relative "base"

module Spectus
  module Requirement
    # Optional requirement level.
    class Optional < Base
      # Key word for use in RFCs to indicate requirement levels.
      #
      # @return [Symbol] The requirement level.
      def self.level
        :MAY
      end

      private

      # Code experiment result.
      #
      # @param (see Base#passed?)
      #
      # @return (see Base#passed?)
      def passed?(test)
        super || test.error.is_a?(::NoMethodError)
      end
    end
  end
end
