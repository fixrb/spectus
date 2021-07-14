# frozen_string_literal: true

require_relative "base"

module Spectus
  module Requirement
    # Absolute requirement and absolute prohibition levels.
    class Required < Base
      # Key word for use in RFCs to indicate requirement levels.
      #
      # @return [Symbol] The requirement level.
      def self.level
        :MUST
      end
    end
  end
end
