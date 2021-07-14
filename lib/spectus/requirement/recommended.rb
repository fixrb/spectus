# frozen_string_literal: true

require_relative "base"

module Spectus
  module Requirement
    # Recommended and not recommended requirement levels.
    class Recommended < Base
      # Key word for use in RFCs to indicate requirement levels.
      #
      # @return [Symbol] The requirement level.
      def self.level
        :SHOULD
      end

      private

      # Code experiment result.
      #
      # @param (see Base#passed?)
      #
      # @return (see Base#passed?)
      def passed?(test)
        super || test.error.nil?
      end
    end
  end
end
