# frozen_string_literal: true

module Spectus
  # Namespace for RFC 2119 requirement levels.
  #
  # This module contains different requirement level implementations:
  # - Required (MUST/MUST NOT)
  # - Recommended (SHOULD/SHOULD NOT)
  # - Optional (MAY)
  #
  # Each level has its own rules for determining test success/failure.
  #
  # @api private
  module Requirement
  end
end

require_relative File.join("requirement", "required")
require_relative File.join("requirement", "recommended")
require_relative File.join("requirement", "optional")
