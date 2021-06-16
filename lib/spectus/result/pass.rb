# frozen_string_literal: true

require "expresenter/pass"

module Spectus
  module Result
    # The class that is responsible for reporting that the expectation is true.
    #
    # @see https://github.com/fixrb/expresenter/blob/v1.2.1/lib/expresenter/pass.rb
    class Pass < ::Expresenter::Pass
    end
  end
end
