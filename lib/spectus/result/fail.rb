# frozen_string_literal: true

require "expresenter/fail"

module Spectus
  module Result
    # The class that is responsible for reporting that the expectation is false.
    #
    # @see https://github.com/fixrb/expresenter/blob/v1.2.1/lib/expresenter/fail.rb
    class Fail < ::Expresenter::Fail
    end
  end
end
