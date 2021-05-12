# frozen_string_literal: true

require "expresenter/fail"

module Spectus
  module Result
    # The class that is responsible for reporting that the expectation is false.
    class Fail < ::Expresenter::Fail
    end
  end
end
