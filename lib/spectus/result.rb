# frozen_string_literal: true

module Spectus
  # Namespace for the results.
  module Result
    # @raise [Fail] A failed spec result.
    # @return [Pass] A passed spec result.
    def self.call(is_passed, **details)
      (is_passed ? Pass : Fail).call(**details)
    end
  end
end

require_relative File.join("result", "fail")
require_relative File.join("result", "pass")
