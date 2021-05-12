# frozen_string_literal: true

require "expresenter/pass"

module Spectus
  module Result
    # The class that is responsible for reporting that the expectation is true.
    class Pass < ::Expresenter::Pass
    end
  end
end
