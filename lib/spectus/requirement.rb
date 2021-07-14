# frozen_string_literal: true

module Spectus
  # Namespace for the results.
  #
  # @api private
  module Requirement
  end
end

require_relative File.join("requirement", "required")
require_relative File.join("requirement", "recommended")
require_relative File.join("requirement", "optional")
